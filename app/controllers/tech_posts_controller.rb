class TechPostsController < ApplicationController
  before_action :set_tech_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
   before_action :authenticate_user!, except: [:index, :show]
#  before_action :authenticate_user!, :except => [:index, :show]

#bafore adding protect from forgery make sure you read https://github.com/plataformatec/devise

  # GET /tech_posts
  # GET /tech_posts.json
  def index
    @tech_posts = TechPost.all
  end

  # GET /tech_posts/1
  # GET /tech_posts/1.json
  def show
  end


#below in get and create i changed it so posts are built through my user - https://stackoverflow.com/questions/6009295/devise-how-to-associate-current-user-to-post



  # GET /tech_posts/new
  def new
    @tech_post = current_user.tech_posts.build
  end

  # GET /tech_posts/1/edit
  def edit
  end

  # POST /tech_posts
  # POST /tech_posts.json
  def create
    @tech_post = current_user.tech_posts.build(tech_post_params)

    respond_to do |format|
      if @tech_post.save
        format.html { redirect_to @tech_post, notice: 'Tech post was successfully created.' }
        format.json { render :show, status: :created, location: @tech_post }
      else
        format.html { render :new }
        format.json { render json: @tech_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tech_posts/1
  # PATCH/PUT /tech_posts/1.json
  def update
    respond_to do |format|
      if @tech_post.update(tech_post_params)
        format.html { redirect_to @tech_post, notice: 'Tech post was successfully updated.' }
        format.json { render :show, status: :ok, location: @tech_post }
      else
        format.html { render :edit }
        format.json { render json: @tech_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tech_posts/1
  # DELETE /tech_posts/1.json
  def destroy
    @tech_post.destroy
    respond_to do |format|
      format.html { redirect_to tech_posts_url, notice: 'Tech post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


def upote
  @tech_post.upote_from current_user
  redirect_to tech_posts_path
end

def downvote
  @tech_post.downvote_from current_user
  redirect_to tech_posts_path
end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tech_post
      @tech_post = TechPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tech_post_params
      params.require(:tech_post).permit(:title, :article, :image, :post_img)
    end
end
