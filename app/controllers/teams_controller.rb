class TeamsController < ApplicationController
    get '/teams/new' do
        erb :'/teams/new'
    end

    get '/teams' do
        @teams = Team.all
        erb :'/teams/index'
    end

    post '/teams' do
        if !logged_in?
            redirect '/'
        end
        if params[:name] != ""
            @team = Team.create(params)
            #binding.pry
            flash[:message] = "Now you're ready to play!"
            @team.user_teams.create(user_id: current_user.id)
            redirect "teams/#{@team.id}"
        else
            flash[:message] = "Sorry, you can't do that!" 
            redirect '/teams/new'
        end

    end

    get '/teams/:id' do
        @team = Team.find(params[:id])
        erb :'/teams/show'

    end

    get '/teams/:id/edit' do
        set_team
        if logged_in?
            if authorized_to_edit?(@team)
                erb :'/teams/edit'
            else
                redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
        end


    end

    patch 'teams/:id' do
        set_team
        if logged_in?
            if @team.user == current_user && params[:name] != ""
                @team.update(name: params[:name])
                redirect "/teams/#{@team.id}"
            else
                redirect "teams/#{current_user.id}"
            end
        else
            redirect '/'
        end

    end

    def set_team
        @team = Team.find(params[:id])
    end

    delete '/teams/:id' do
        set_team
        @team.destroy
        redirect '/teams'

    end

    get '/team/:id/join' do
        
        #form with pw to join team

    end

    post 'team/:id/join' do
        #take in pw from form and auth from has_secure_password, if successful, add current user to team

        #look at update for example

    end
    

end