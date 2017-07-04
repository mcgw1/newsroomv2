class AllpostsController < ApplicationController
  before_action :set_allpost, only: [:show, :edit, :update, :destroy]
   before_action :authenticate_user!, except: [:index, :show]
#  before_action :authenticate_user!, :except => [:index, :show]

#bafore adding protect from forgery make sure you read https://github.com/plataformatec/devise

  # GET /allposts
  # GET /allposts.json
  def index
    @allposts = Allpost.all
  end

  # GET /allposts/1
  # GET /allposts/1.json
  def show
  end

  # GET /allposts/new
  def new
    @allpost = Allpost.new
  end

  # GET /allposts/1/edit
  def edit
  end

  # POST /allposts
  # POST /allposts.json
  def create
    @allpost = Allpost.new(allpost_params)

    respond_to do |format|
      if @allpost.save
        format.html { redirect_to @allpost, notice: 'Allpost was successfully created.' }
        format.json { render :show, status: :created, location: @allpost }
      else
        format.html { render :new }
        format.json { render json: @allpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /allposts/1
  # PATCH/PUT /allposts/1.json
  def update
    respond_to do |format|
      if @allpost.update(allpost_params)
        format.html { redirect_to @allpost, notice: 'Allpost was successfully updated.' }
        format.json { render :show, status: :ok, location: @allpost }
      else
        format.html { render :edit }
        format.json { render json: @allpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /allposts/1
  # DELETE /allposts/1.json
  def destroy
    @allpost.destroy
    respond_to do |format|
      format.html { redirect_to allposts_url, notice: 'Allpost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end







  private
    # Use callbacks to share common setup or constraints between actions.
    def set_allpost
      @allpost = Allpost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def allpost_params
      params.require(:allpost).permit(:title, :article, :image)
    end
end
