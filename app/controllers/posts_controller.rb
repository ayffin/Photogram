class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :owned_post, only: [:edit, :update,:destroy]
  def index
    @posts = Post.all
  end

  def show

  end
  def new
     @post = current_user.posts.build
  end
  def create
     @post = current_user.posts.build(post_params)

    if @post.save
      flash[:sucess] = "Image is uploaded successfully"
      redirect_to posts_path
    else
      flash.now[:alert] = "There was an error saving image"
      render :new
    end
  end

  def edit

  end

  def update

    @post.update(post_params)
     redirect_to(post_path(@post))
  end

  def destroy

    if @post.destroy
      flash[:notice] = "Image is destroyed successfully"
      redirect_to posts_path
    else
      flash.now[:alert] = "There was an error destroy image"
      render :show
    end
  end

  private
  def post_params
    params.require(:post).permit(:image, :caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def owned_post
  unless current_user == @post.user
    flash[:alert] = "That post doesn't belong to you!"
    redirect_to root_path
  end
end
end
