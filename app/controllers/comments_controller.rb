class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:post).permit(:title, :body)
    @post.user = current_user
    @post = @comment
    authorize @post
    if @post.save
     flash[:notice] = “Comment was saved.”
     redirect_to [@comment, @post]
    else
    flash[:error] = “Error when saving comment.”
    render :new
    end
  end
end

