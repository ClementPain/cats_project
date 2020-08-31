class CatPicturesController < ApplicationController


    
    def index
    	@cat_pictures = CatPicture.all
    end

    def show
		@cat_picture = CatPicture.find(params[:id])
	end

	
end
