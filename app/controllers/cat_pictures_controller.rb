class CatPicturesController < ApplicationController
    
    def index
    	@cat_pictures = CatPicture.all
    end

    def show
        @cat = CatPicture.find(params[:id])
    end

    def new
        @cat = CatPicture.new
    end

    def create
        @cat = CatPicture.new(cat_params)
        
        if @cat.save
            redirect_to new_cat_picture_path, notice: "L'image #{@cat.title} a bien été uploadée ! Bien joué petit génie !"
        else
            redirect_to new_cat_picture_path, alert: "Certaines informations sont incorrectes   "
        end
    end

    private

    def cat_params
        params.require(:cat_picture).permit(:title, :description, :price, :cat_image)
    end
end
