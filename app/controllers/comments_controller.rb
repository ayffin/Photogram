class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = "You commented the hell out of that post!"
      redirect_to :back
    else
      flash[:alert] = "Check the comment form, something went horribly wrong."
      render root_path
    end
  end

  def create
    @post = Post.find(params[:id])
    @comment = @post.comments.find(params[:id])



    if @comment.destroy
      flash[:notice] = "Comment was deleted."
      redirect_to [@post]
    else
      flash[:alert] = "Comment couldn't be deleted. Try again."
      redirect_to [@post]
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
