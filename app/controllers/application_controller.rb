require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @username = params[:username]
    @password = params[:password]
    @current_user = User.find_by(:username)
      if @current_user.password == @password
          @session = session[:username]
          redirect '/account'
      else redirect '/error'
      end
  end

  get '/account' do

    erb :account
  end

  get '/logout' do
    erb :'/'
  end

  get '/error' do

    erb :error
  end


end
