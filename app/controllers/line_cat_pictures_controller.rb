class LineCatPicturesController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_cat_picture, only: [:show, :edit, :update, :destroy]
  authorize_resource

  # GET /line_cat_pictures
  # GET /line_cat_pictures.json
  def index
    @line_cat_pictures = LineCatPicture.all
  end

  # GET /line_cat_pictures/1
  # GET /line_cat_pictures/1.json
  def show
  end

  # GET /line_cat_pictures/new
  def new
    @line_cat_picture = LineCatPicture.new
  end

  # GET /line_cat_pictures/1/edit
  def edit
  end

  # POST /line_cat_pictures
  # POST /line_cat_pictures.json
  def create
    if current_user
      
      # créer un panier si l'utilisateur n'en a pas
      Cart.create(user:current_user) if !current_user.cart

      LineCatPicture.create(cart_id:current_user.cart.id, cat_picture_id:params[:cat_picture_id])
      redirect_to root_path, notice: "La photo #{CatPicture.find(params[:cat_picture_id]).title} a bien été ajoutée à ton panier ! Bien joué petit génie !"
    else
      redirect_to new_user_registration_path, alert: "Veuillez vous connecter"
    end
    
    # respond_to do |format|
    #   if @line_cat_picture.save
    #     format.html { redirect_to @line_cat_picture.cart, notice: 'Line cat picture was successfully created.' }
    #     format.json { render :show, status: :created, location: @line_cat_picture }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @line_cat_picture.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /line_cat_pictures/1
  # PATCH/PUT /line_cat_pictures/1.json
  def update
    respond_to do |format|
      if @line_cat_picture.update(line_cat_picture_params)
        format.html { redirect_to @line_cat_picture, notice: 'Line cat picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_cat_picture }
      else
        format.html { render :edit }
        format.json { render json: @line_cat_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_cat_pictures/1
  # DELETE /line_cat_pictures/1.json
  def destroy
    LineCatPicture.find(params[:id]).delete
    redirect_to(user_carts_path)
    # respond_to do |format|
    #   format.html { redirect_to line_cat_pictures_url, notice: 'Line cat picture was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_cat_picture
      @line_cat_picture = LineCatPicture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def line_cat_picture_params
      params.require(:line_cat_picture).permit(:cart_id, :cat_picture_id)
    end
end
