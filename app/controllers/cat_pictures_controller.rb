class CatPicturesController < ApplicationController
    load_and_authorize_resource
    
    def index
        @cat_pictures = CatPicture.select { |cat| cat.insale }
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

    def edit
        @cat = CatPicture.find(params[:id])
    end

    def update
        @cat = CatPicture.find(params[:id])
        @cat.update(cat_params)

        if params[:cat_image]
            @cat.cat_image.purge
            @cat.cat_image.attach(params[:cat_image])
        end

        redirect_to cat_picture_path(@cat.id), notice: "L'image #{@cat.title} a bien été modifiée ! Bien joué petit génie !"
    end

    def destroy
        @cat = CatPicture.find(params[:id])
        
        if @cat.insale
            @cat.update(insale: false)
            redirect_to cat_picture_path(@cat.id), alert: "L'image #{@cat.title} n'est plus en vente !"
        else
            @cat.update(insale: true)
            redirect_to cat_picture_path(@cat.id), notice: "L'image #{@cat.title} est de nouveau en vente !"
        end        
    end

    private

    def cat_params
        params.require(:cat_picture).permit(:title, :description, :price, :cat_image)
    end
end
