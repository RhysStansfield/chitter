require 'sinatra/base'
require 'sinatra/partial'
require 'rack-flash'

#Models:
require_relative './models/posts'
require_relative './models/user'

#Controllers:
require_relative './web/home'
require_relative './web/new_user'
require_relative './web/add_post'
require_relative './web/reply'
require_relative './web/sign_in'
require_relative './web/sign_out'

#Helpers:
require_relative './helpers/app'

class Chitter < Sinatra::Base

  helpers UserUtils

  use Rack::Flash
  register Sinatra::Partial

  enable :sessions
  set :partial_template_engine, :erb
  set :session_secret, 'supersecretyness'

  set :views, File.join(File.dirname(__FILE__), '..', 'views')
  
  # start the server if ruby file executed directly
  run! if app_file == $0
end
