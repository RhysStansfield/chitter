class Chitter < Sinatra::Base

  post '/sign_out' do
    session.clear
    session[:just_logged_out] = 'See you next time!'
    redirect to('/')
  end

end