class SearchController < ApplicationController
def search 
        
          @pet = Pet.find_by_sql(["select * from pets where breeds like? OR nickname LIKE?OR city LIKE?",
            "%#{params[:search]}%","%#{params[:search]}%","%#{params[:search]}%"])
        if @pet.length ==0
          if params[:search].empty? == false && params[:search].blank? == true
            flash[:notice] = "Can not be blank!" 
            redirect_to :action => 'home',:controller=> 'static_pages'
          else
            flash[:notice] = "Not Found!" 
            redirect_to :action => 'index',:controller=> 'pets'
          end
        end
      end
    end