class CatPicturesController < ApplicationController
    def index
    end

    def show
        @cat = CatPicture.find(params[:id])
    end
end
