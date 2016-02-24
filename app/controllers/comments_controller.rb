class CommentsController < ApplicationController
  def create
    #@topic = Topic.find(params[:topic_id])
    #@post = @topic.posts.find(params[:post_id])
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post = @post
    
    authorize @comment
    if @comment.save
     redirect_to [@post.topic, @post], notice: "Comment was saved."
    else
     redirect_to [@post.topic, @post], notice:  "Error saving comment."   
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])
    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
    end

    respond_to do |format|
      format.html
      format.js  
    end
  end
  
  private

  def comment_params
  params.require(:comment).permit(:body)
  end
end

