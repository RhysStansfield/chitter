class Chitter < Sinatra::Base

  get '/' do
    if session[:just_logged_out]
      flash.now[:just_logged_out] = session[:just_logged_out]
      session.clear
    end
    @posts = Post.all(order: [:time.desc])
    erb :index
  end

end  