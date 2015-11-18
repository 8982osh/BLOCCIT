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
     
     #render 'post/show'
        
    end
  end
  
  def destroy
    #@topic = Topic.find(params[:topic_id])
    #@post = @topic.posts.find(params[:post_id])
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])
    
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@post.topic, @post]
    end
  end
  
  private
  def comment_params
  params.require(:comment).permit(:body)
  end
end

