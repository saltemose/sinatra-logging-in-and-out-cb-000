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
    @user = User.find_by(:username => params[:username])
      if @current_user.password == @password
          session[:user_id] = @user.id
          redirect '/account'
      else redirect '/error'
      end
  end

  get '/account' do

    erb :account
  end

  get '/logout' do
    redirect :'/'
  end

  get '/error' do

    erb :error
  end


end
