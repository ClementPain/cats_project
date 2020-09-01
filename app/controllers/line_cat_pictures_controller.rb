class LineCatPicturesController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_cat_picture, only: [:show, :edit, :update, :destroy]

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
    cat_picture = CatPicture.find(params[:cat_picture_id])
    @line_cat_picture = @cart.line_cat_pictures.new(cat_picture: cat_picture)

    respond_to do |format|
      if @line_cat_picture.save
        format.html { redirect_to @line_cat_picture.cart, notice: 'Line cat picture was successfully created.' }
        format.json { render :show, status: :created, location: @line_cat_picture }
      else
        format.html { render :new }
        format.json { render json: @line_cat_picture.errors, status: :unprocessable_entity }
      end
    end
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
    @line_cat_picture.destroy
    respond_to do |format|
      format.html { redirect_to line_cat_pictures_url, notice: 'Line cat picture was successfully destroyed.' }
      format.json { head :no_content }
    end
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
