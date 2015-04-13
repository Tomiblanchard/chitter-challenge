require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require_relative './data_mapper_setup'
require_relative 'models/user'
require_relative 'models/peep'
require_relative 'helpers/current_user'
require_relative 'controllers/application'
require_relative 'controllers/peeps'
require_relative 'controllers/users'
require_relative 'controllers/sessions'


DataMapper.finalize
DataMapper.auto_upgrade!

enable :sessions
set :session_secret, 'super secret'
set :root, File.dirname(__FILE__)
set :views, Proc.new { File.join(root, '/views')}
set :public_folder, Proc.new { File.join(root, "../public") }
use Rack::MethodOverride
use Rack::Flash
helpers CurrentUser
