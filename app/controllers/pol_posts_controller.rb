class PolPostsController < ApplicationController
  before_action :set_pol_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show]
#  before_action :authenticate_user!, :except => [:index, :show]

#bafore adding protect from forgery make sure you read https://github.com/plataformatec/devise



  # GET /pol_posts
  # GET /pol_posts.json
  def index
    @pol_posts = PolPost.all.order(:cached_votes_up => :desc)
  end

  # GET /pol_posts/1
  # GET /pol_posts/1.json
  def show
  end



#below in get and create i changed it so posts are built through my user - https://stackoverflow.com/questions/6009295/devise-how-to-associate-current-user-to-post

  # GET /pol_posts/new
  def new
    @pol_post = current_user.pol_posts.build
  end

  # GET /pol_posts/1/edit
  def edit
  end

  # POST /pol_posts
  # POST /pol_posts.json
  def create
    @pol_post = current_user.pol_posts.build(pol_post_params)

    respond_to do |format|
      if @pol_post.save
        format.html { redirect_to @pol_post, notice: 'Pol post was successfully created.' }
        format.json { render :show, status: :created, location: @pol_post }
      else
        format.html { render :new }
        format.json { render json: @pol_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pol_posts/1
  # PATCH/PUT /pol_posts/1.json
  def update
    respond_to do |format|
      if @pol_post.update(pol_post_params)
        format.html { redirect_to @pol_post, notice: 'Pol post was successfully updated.' }
        format.json { render :show, status: :ok, location: @pol_post }
      else
        format.html { render :edit }
        format.json { render json: @pol_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pol_posts/1
  # DELETE /pol_posts/1.json
  def destroy
    @pol_post.destroy
    respond_to do |format|
      format.html { redirect_to pol_posts_url, notice: 'Pol post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def upvote
  @pol_post.upvote_from current_user
  redirect_to pol_posts_path
end

def downvote
  @pol_post.downvote_from current_user
  redirect_to pol_posts_path
end










  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pol_post
      @pol_post = PolPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pol_post_params
      params.require(:pol_post).permit(:title, :article, :image, :post_img)
    end
end
