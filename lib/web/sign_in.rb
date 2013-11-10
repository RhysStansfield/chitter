class Chitter < Sinatra::Base

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
      flash.now[:sign_in_error] = 'The username or password are incorrect'
      erb :"sessions/new"
    end
  end

end