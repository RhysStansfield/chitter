require 'sinatra/base'
require 'rack-flash'

require_relative 'posts'
require_relative 'user'
require_relative './helpers/app'

class Chitter < Sinatra::Base

  helpers UserUtils

  use Rack::Flash

  enable :sessions
  set :session_secret, 'supersecretyness'

  set :views, File.join(File.dirname(__FILE__), '..', 'views')
  
  get '/' do
    if session[:just_logged_out]
      flash.now[:just_logged_out] = session[:just_logged_out]
      session.clear
    end
    @posts = Post.all(order: [:time.desc])
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :"users/new"
  end

  post '/users' do
    @user = User.create(
      email: params['email'],
      password: params['password'],
      password_confirmation: params['password_confirmation'],
      name: params['name'],
      username: params['username']
      )
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:sign_up_errors] = @user.errors.full_messages
      erb :"users/new"
    end
  end

  get '/add_post' do
    erb :"posts/new"
  end

  post '/add_post' do
    user = User.get(session[:user_id])
    Post.create(
      body: params['message'],
      user: user.name,
      username: user.username,
      time: Time.now
      )
    redirect to('/')
  end

  get '/session/new' do
    erb :"sessions/new"
  end

  post '/session/new' do
    username, password = params['username'], params['password']
    user = User.authenticate(username, password)
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:sign_in_error] = ['The email or password are incorrect']
      erb :"sessions/new"
    end
  end

  post '/sign_out' do
    session.clear
    session[:just_logged_out] = 'See you next time!'
    redirect to('/')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
