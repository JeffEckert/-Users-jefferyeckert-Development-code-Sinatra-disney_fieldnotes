class UsersController < ApplicationController
    

    get '/signup' do
        erb :'users/signup'
    end

  
    post '/signup' do
     user = User.new(:username => params[:username], :password => params[:password])
 
  if user.save
    redirect '/attractions'
  else
    @error = "some information may not be correct. Please try again."
    redirect "/signup"
  end
    end
end