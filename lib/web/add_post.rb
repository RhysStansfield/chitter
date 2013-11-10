class Chitter < Sinatra::Base

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

end