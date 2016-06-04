class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 3)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      flash[:notice] = "Your post was successfully saved"
      redirect_to posts_path(@post)
    else
      flash.now[:error] = "Something went wrong"
      render :new
    end
  end

  def update

    if @post.update(post_params)
      flash[:notice] = "Your post successfully updated"
      redirect_to posts_path(@post)
    else
      flash[:error] = "Something is wrong"
      render :edit
  end
  end

  def destroy
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
      params.require(:post).permit(:title, :text, :user_id)
    end
end
