class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.create(post_params)
    @post.user_id = current_user.id if current_user
    @post.save

    if @post.save
      flash[:notice] = "Your post was successfully saved"
      redirect_to topic_path(@topic)
    else
      flash.now[:error] = "Something went wrong"
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = "Your post successfully updated"
      redirect_to posts_path(@post)
    else
      flash[:error] = "Something is wrong"
      render :edit
  end
  end

   def edit
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])
  end

  def destroy
    
    @post = Topic.posts.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, error: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_post
      @post = Post.find(params[:id])
    end

   
    def post_params
      params.require(:post).permit(:title, :text, :user_id, :topic_id)
    end
end
