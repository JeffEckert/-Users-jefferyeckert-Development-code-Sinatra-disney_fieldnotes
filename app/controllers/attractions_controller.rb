class AttractionsController < ApplicationController

    # CREATE
         # New
         # make get request to "/recipes/new"
         get '/attractions/new' do
            erb :'attractions/new'
        end


         # Create
         # make a post request to "/attractions"
         post '/attractions' do
           attraction = Attraction.new(params)
    
            if !attraction.name.empty? && !attraction.park.empty?
                attraction.save
                redirect '/attractions'
            else
                erb :'attractions/new'
            end
         end



    # READ
         # Index
         # make a get request to "/attractions"

         get '/attractions' do 
            @attractions = Attraction.all
            erb :'attractions/index'
         end

         # Show
         # make a get request to "/attractions/:id"
         get '/attractions/:id' do
            @attraction = Attraction.find(params["id"])
            erb :'attractions/Show'
         end

    # UPDATE
        # Edit
        # make get request to "/attractions/:id/edit"

        # Update
        # make a patch request to "/attractions/:id"

    # DESTROY

        # make a delete request to "/attractions/:id"


end