class CatPicturesController < ApplicationController
    
    def index
    	@cat_pictures = CatPicture.all
    end

    def show
        @cat = CatPicture.find(params[:id])
    end

end
