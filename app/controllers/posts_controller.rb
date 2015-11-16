class PostsController < ApplicationController
  
  skip_before_action :flash_attack, only: [:index, :new]
  
  
  def index
    @posts = Post.all
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
    #authorize @comment
    #@comments = @post.comments.all
    @comment = @post.comments.build
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    #@post = Post.new(params.require(:post).permit(:title, :body))
    @post = Post.new(post_params)
    @post.user = current_user
    @post.topic = @topic
    authorize @post
    @comment = Comment.new(params.require(:comment).permit(:title, :body))
    @comment.user = user.present?
    authorize @comment
    
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     authorize @post
  end

   def update
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     # reset the values for post
     # save
     if @post.update(post_params)
       #if @post.update_attributes(params.require(:post).permit(:title, :body))
       flash[:notice] = "Post was updated."
       redirect_to [@topic, @post]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
   end
   
   def destroy
    @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     authorize @post
 
     if @post.destroy
       flash[:notice] = "\"#{@post.title}\" was deleted successfully."
       redirect_to @topic
     else
       flash[:error] = "There was an error deleting the post."
       render :show
     end
   end
   
   private
   
   def post_params
      #params.require(:post).permit(:title, :body)
      params.require(:post).permit(:name, :image)
   end
end
