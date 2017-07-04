class WnewsPostsController < ApplicationController
  before_action :set_wnews_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show]
#  before_action :authenticate_user!, :except => [:index, :show]

#bafore adding protect from forgery make sure you read https://github.com/plataformatec/devise
  # GET /wnews_posts
  # GET /wnews_posts.json
  def index
    @wnews_posts = WnewsPost.all.order(:cached_votes_up => :desc)
  end

  # GET /wnews_posts/1
  # GET /wnews_posts/1.json
  def show
  end



#below in get and create i changed it so posts are built through my user - https://stackoverflow.com/questions/6009295/devise-how-to-associate-current-user-to-post


  # GET /wnews_posts/new
  def new
    @wnews_post = current_user.wnews_posts.build
  end

  # GET /wnews_posts/1/edit
  def edit
  end

  # POST /wnews_posts
  # POST /wnews_posts.json
  def create
    @wnews_post = current_user.wnews_posts.build(wnews_post_params)

    respond_to do |format|
      if @wnews_post.save
        format.html { redirect_to @wnews_post, notice: 'Wnews post was successfully created.' }
        format.json { render :show, status: :created, location: @wnews_post }
      else
        format.html { render :new }
        format.json { render json: @wnews_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wnews_posts/1
  # PATCH/PUT /wnews_posts/1.json
  def update
    respond_to do |format|
      if @wnews_post.update(wnews_post_params)
        format.html { redirect_to @wnews_post, notice: 'Wnews post was successfully updated.' }
        format.json { render :show, status: :ok, location: @wnews_post }
      else
        format.html { render :edit }
        format.json { render json: @wnews_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wnews_posts/1
  # DELETE /wnews_posts/1.json
  def destroy
    @wnews_post.destroy
    respond_to do |format|
      format.html { redirect_to wnews_posts_url, notice: 'Wnews post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def upvote
  @wnews_post.upvote_from current_user
  redirect_to wnews_posts_path
end

def downvote
  @wnews_post.downvote_from current_user
  redirect_to wnews_posts_path
end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wnews_post
      @wnews_post = WnewsPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wnews_post_params
      params.require(:wnews_post).permit(:title, :article, :image, :post_img)
    end
end
