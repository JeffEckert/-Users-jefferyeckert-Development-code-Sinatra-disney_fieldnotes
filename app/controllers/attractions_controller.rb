class AttractionsController < ApplicationController

    # CREATE
         # New
         # make get request to "/recipes/new"


         # Create
         # make a post request to "/attractions"

    # READ
         # Index
         # make a get request to "/attractions"

         get 'recipes' do 
            erb :'recipes/index' 
         end

         # Show
         # make a get request to "/attractions/:id"

    # UPDATE
        # Edit
        # make get request to "/attractions/:id/edit"

        # Update
        # make a patch request to "/attractions/:id"

    # DESTROY

        # make a delete request to "/attractions/:id"


end