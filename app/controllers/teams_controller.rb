class TeamsController < ApplicationController
    get '/teams/new' do
        erb :'/teams/new'
    end

    get '/teams' do
        redirect_if_not_logged_in
        @teams = Team.all
        erb :'/teams/index'
    end

    post '/teams' do
        redirect_if_not_logged_in
        if params[:name] != ""
            params["creator_id"] = current_user.id
            #binding.pry
            @team = Team.create(params)
            #binding.pry
            flash[:message] = "Now you're ready to play!"
            @team.user_teams.create(user_id: current_user.id)
            redirect "teams/#{@team.id}"
        else
            flash[:errors] = "Sorry, you need a name!" 
            redirect '/teams/new'
        end

    end

    get '/teams/:id' do
        redirect_if_not_logged_in
        @team = Team.find(params[:id])
        erb :'/teams/show'

    end

    get '/teams/:id/edit' do
        set_team
        redirect_if_not_logged_in
            
        if authorized_to_edit?(@team)
            erb :'/teams/edit'
        else
            redirect "users/account"
        end


    end

    patch '/teams/:id' do
        set_team
        redirect_if_not_logged_in
        #binding.pry
        if  params[:name] != ""
            #@team.user == current_user && 
           
            #@team.name = password[:name]
           @team.update(name: params[:name])
            redirect "/teams"
        else
            redirect "/teams/#{current_user.id}"
        end

    end

    def set_team
        @team = Team.find(params[:id])
    end

    delete '/teams/:id' do
        @teams = Team.all
        set_team
        if authorized_to_edit?(@team)
            @team.destroy
            flash[:message] = "Team deleted"
            redirect '/teams'
        else
            redirect '/teams'

        end



    end

    get '/teams/:id/join' do
        @team_id = params[:id]
        erb :"teams/join"

    end

    post '/teams/:id/join' do
        set_team
        if @team && @team.authenticate(params[:password])
            flash[:message] = "Welcome to the team!"
            @team.user_teams.create(user_id: current_user.id)
            redirect "teams/#{@team.id}/roster"
        else
            flash[:errors] = "Incorrect password. Please check with your team creator and try again!"
            redirect "/teams/#{@team.id}/join"

       end


    end

    get '/teams/:id/roster' do
        set_team
        @roster = @team.users
        erb :'teams/roster'
    end

    post 'teams/:id/roster' do
        
        #.users

    end
    

end