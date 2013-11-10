class Chitter < Sinatra::Base

  get '/add_post' do
    if session[:reply_to]
      @recipient = session[:reply_to]
      session[:reply_to] = nil
    end
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