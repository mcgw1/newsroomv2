class SportPostsController < ApplicationController
  before_action :set_sport_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show]
#  before_action :authenticate_user!, :except => [:index, :show]

#bafore adding protect from forgery make sure you read https://github.com/plataformatec/devise

  # GET /sport_posts
  # GET /sport_posts.json
  def index
    @sport_posts = SportPost.all
  end

  # GET /sport_posts/1
  # GET /sport_posts/1.json
  def show
  end


#below in get and create i changed it so posts are built through my user - https://stackoverflow.com/questions/6009295/devise-how-to-associate-current-user-to-post

  # GET /sport_posts/new
  def new
    @sport_post = current_user.sport_posts.build
  end

  # GET /sport_posts/1/edit
  def edit
  end

  # POST /sport_posts
  # POST /sport_posts.json
  def create
    @sport_post = current_user.sport_posts.build(sport_post_params)

    respond_to do |format|
      if @sport_post.save
        format.html { redirect_to @sport_post, notice: 'Sport post was successfully created.' }
        format.json { render :show, status: :created, location: @sport_post }
      else
        format.html { render :new }
        format.json { render json: @sport_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sport_posts/1
  # PATCH/PUT /sport_posts/1.json
  def update
    respond_to do |format|
      if @sport_post.update(sport_post_params)
        format.html { redirect_to @sport_post, notice: 'Sport post was successfully updated.' }
        format.json { render :show, status: :ok, location: @sport_post }
      else
        format.html { render :edit }
        format.json { render json: @sport_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sport_posts/1
  # DELETE /sport_posts/1.json
  def destroy
    @sport_post.destroy
    respond_to do |format|
      format.html { redirect_to sport_posts_url, notice: 'Sport post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


def upote
  @sport_post.upote_from current_user
  redirect_to sport_posts_path
end

def downvote
  @sport_post.downvote_from current_user
  redirect_to sport_posts_path
end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sport_post
      @sport_post = SportPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sport_post_params
      params.require(:sport_post).permit(:title, :article, :image, :post_img)
    end
end
