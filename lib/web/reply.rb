class Chitter < Sinatra::Base

  post '/reply' do
    session[:reply_to] = params['originalposter']
    redirect to('/add_post')
  end

end