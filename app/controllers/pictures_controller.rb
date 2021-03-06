class PicturesController < ApplicationController
  prepend_before_action :authenticate_user!
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.limit(15).order("updated_at desc")
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
  end

  # GET /pictures/new
  def new
      @picture = Picture.new
  end

  # GET /pictures/1/edit
  def edit
  end

  def confirm
    @picture = Picture.new(picture_params)
    render 'new' if @picture.invalid?
  end
  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    respond_to do |format|
      if @picture.save
        format.html { redirect_to pictures_path }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new, notice: "投稿できませんでした" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    if @picture.update(picture_params)
      redirect_to @picture, notice: '写真を投稿しました！'
    else
      render 'edit'
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: '写真を削除しました！' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:title, :comment, :photos_url, :photos_url_cache)
    end
end
