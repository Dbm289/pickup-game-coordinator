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
            #likely need something else here
            redirect "teams/#{@team.id}"
        else 
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
            if @team.user == current_user
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
            @team.update(name: params[:name])
            redirect "/teams/#{@team.id}"
            if @team.user == current_user
                @team.update(name: params[:name])
            else
                redirect "teams/#{team.id}"
            end
        else
            redirect '/'
        end

    end

    def set_team
        @team = Team.find(params[:id])
    end

    get '/team/:id/join' do
        
        #form with pw to join team

    end

    post 'team/:id/join' do
        #take in pw from form and auth from has_secure_password, if successful, add current user to team

        #look at update for example

    end
    

end