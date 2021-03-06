require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "pickup_game_coordinator_app"
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      redirect "/users/account"
    else
    erb :welcome
    end
  end

  helpers do

    def logged_in?
      !!current_user

    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])

    end

    def authorized_to_edit?(team)
      #binding.pry
      team.users.include?(current_user)
    end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:errors] = "You need to log in first!"
        redirect '/'
      end
    end
  end

end
