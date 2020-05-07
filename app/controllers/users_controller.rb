class UsersController < ApplicationController
    #users can sign up

    get '/signup' do
        erb :'users/signup'
    end

    #users can delete account
    post '/signup' do
        user = User.new(params)
        if user.username.empty? || user.password.empty?
            @error = "Username or Password invalid Please try again."
            erb :'users/signup'
        elsif User.find_by(username: user.username)
            @error = "Account with that username already Exists"
            erb :'users/signup'

        else
            user.save
            session[:user_id] = user.id
            redirect '/attractions'
        end
    end
end