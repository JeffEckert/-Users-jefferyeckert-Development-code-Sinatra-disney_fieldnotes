class AttractionsController < ApplicationController

    # CREATE
         # New
         # make get request to "/recipes/new"
         get '/attractions/new' do
            require_login
                erb :'attractions/new'
        end


         # Create
         # make a post request to "/attractions"
         post '/attractions' do
        filtered_params = params.reject{|key, value| key == "photo" && value.empty?}
           attraction = current_user.attractions.build(filtered_params)
           attraction.photo = nil if attraction.photo.empty?
            if !attraction.name.empty? && !attraction.park.empty?
                attraction.save
                redirect '/attractions'
            else
                @error = "Data invalid. Please try again"
                erb :'attractions/new'
            end
         end



    # READ
         # Index
         # make a get request to "/attractions"

         get '/attractions' do
                require_login
                 @attractions = Attraction.all.reverse
                 erb :'/attractions/index'
         end

         # Show
         # make a get request to "/attractions/:id"
         get '/attractions/:id' do
            require_login
                @attraction = Attraction.find_by(id: params[:id])
                erb :'/attractions/Show'
         end

    # UPDATE
        # Edit
        # make get request to "/attractions/:id/edit"
        get '/attractions/:id/edit' do
            require_login
             @attraction = Attraction.find(params[:id])
             erb :'attractions/edit'
         end

        # Update
        # make a patch request to "/attractions/:id"
        patch '/attractions/:id' do
            @attraction = Attraction.find(params[:id])
            if !params["attraction"]["name"].empty? && !params["attraction"]["park"].empty? && !params["attraction"]["notes"].empty?

                 @attraction.update(params["attraction"])  
                redirect "attractions/#{params[:id]}"
            else
                @error = "Data invalid. Please try again"
                erb :'attractions/edit'
            end
        end

    # DESTROY

        # make a delete request to "/attractions/:id"
        delete '/attractions/:id' do
            attraction = Attraction.find(params[:id])
            attraction.destroy 
            redirect '/attractions'
        end


end