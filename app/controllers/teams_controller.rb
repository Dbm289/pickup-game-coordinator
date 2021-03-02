class TeamsController < ApplicationController
    get '/teams/new' do
        erb :'/teams/new'
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
    

end