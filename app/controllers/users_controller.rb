class UsersController < ApplicationController

    get '/login' do
        erb :login

    end

    post '/login' do
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            puts session
            flash[:message] = "Welcome, #{@user.name}!"
            redirect "/users/account"

        else
            flash[:errors] = "Incorrect email or password. Please sign up or try again!"
            redirect '/login'

        end

    end

    get '/signup' do
        erb :signup

    end

    post '/users' do
        @user = User.new(params)
        if @user.save
            #params[:name] != "" && params[:email] != "" && params[:password] != ""
            
            session[:user_id] = @user.id
            flash[:message] = "Congrats on your new account, #{@user.name}!"
            redirect "/users/account"
        else
            flash[:errors] = "Whoops! #{@user.errors.full_messages.to_sentence} Please give us another shot!"
            redirect '/signup'
        end


    end

    get '/users/account' do
        
        @user = current_user
        erb :'users/show'

    end

    get '/logout' do
        session.clear
        redirect '/'

    end

    get '/users/account/edit' do 
        current_user
        erb :'/users/edit'
      end

    patch '/users/account' do
        current_user
         #binding.pry
        if  params[:name] != "" && params[:email] != ""
           params.delete("_method")
           @current_user.update(params)
          
           flash[:message] = "Account updated"
           redirect "/users/account"
        
        else
            redirect "/users/account/edit"
        end

    end

end