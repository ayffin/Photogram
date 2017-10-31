class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  def create
    @post = Post.create(post_params)

    if @post.save
      flash[:notice] = "Image is uploaded successfully"
      redirect_to posts_path
    else
      flash.now[:alert] = "There was an error saving image"
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:image, :caption)
  end
end
