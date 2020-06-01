class AttractionsController < ApplicationController


         get '/attractions/new' do
            require_login
                erb :'attractions/new'
        end


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




         get '/attractions' do
                require_login
                 @attractions = Attraction.all.reverse
                 erb :'/attractions/index'
         end

       
         get '/attractions/:id' do
            require_login
                @attraction = Attraction.find_by(id: params[:id])
                erb :'/attractions/Show'
         end

        get '/attractions/:id/edit' do
            require_login
             @attraction = Attraction.find(params[:id])
             erb :'attractions/edit'
         end

      
        patch '/attractions/:id' do
            require_login
           
            @attraction = Attraction.find(params[:id])
            
            
            if !params["attraction"]["name"].empty? && !params["attraction"]["park"].empty? && !params["attraction"]["notes"].empty? 
                if @attraction.user == current_user

                 @attraction.update(params["attraction"])  
                end
                redirect "attractions/#{params[:id]}"
            else
                @error = "Data invalid. Please try again"
                erb :'attractions/edit'
            end
        end

    
        delete '/attractions/:id' do
            require_login
             attraction = Attraction.find(params[:id])
            if attraction.user == current_user
                attraction.destroy 
                redirect '/attractions'
            end
        end


end