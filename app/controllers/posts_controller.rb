class PostsController < ApplicationController
  
  skip_before_action :flash_attack, only: [:index, :new]
  
  
  def index
    @posts = Post.all
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @comment = @post.comments.new
    authorize @comment
    @comments = @post.comments.all
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
     if @post = Post.new(post_params)
       #if @post.update_attributes(params.require(:post).permit(:title, :body))
       flash[:notice] = "Post was updated."
       redirect_to [@topic, @post]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
   end
   
   private
   
   def post_params
      params.require(:post).permit(:title, :body)
   end
end
