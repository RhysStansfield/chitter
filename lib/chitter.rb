require 'sinatra/base'
require 'rack-flash'

require_relative './helpers/app'

class Chitter < Sinatra::Base

  helpers UserUtils

  use Rack::Flash

  enable :sessions
  set :session_secret, 'supersecretyness'

  set :views, File.join(File.dirname(__FILE__), '..', 'views')
  
  get '/' do
    @posts = Post.all
    erb :index
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    @user = User.create(
      email: params['email'],
      password: params['password'],
      name: params['name'],
      username: params['username']
      )
    session[:user_id] = @user.id
    redirect to('/')
  end

  get '/add_post' do
    erb :"posts/new"
  end

  post '/add_post' do
    user = User.get(session[:user_id])
    Post.create(
      body: params['message'],
      user: user.username,
      time: Time.now
      )
    redirect to('/')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
