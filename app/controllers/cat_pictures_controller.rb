class CatPicturesController < ApplicationController

        @cat_pictures = CatPicture.all
        

    
    def index
    	@cat_pictures = CatPicture.all
    end

    def show
        @cat = CatPicture.find(params[:id])
    end


    
end
