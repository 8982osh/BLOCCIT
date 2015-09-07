class PostsController < ApplicationController
  
  def show
    @summary = Summary.find(params[:summary_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def new
    @summary = Summary.find(params[:summary_id])
    @post = Post.new
    authorize @post
  end
  
  def edit
     @summary = Summary.find(params[:summary_id])
     @post = Post.find(params[:id])
     authorize @post
  end
  
  def create
    @summary = Summary.find(params[:summary_id])
    @post = Post.new(params.require(:post).permit(:title, :body))
    @post.user = current_user
    @post.summary = @summary
    authorize @post
    
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@summary, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end
  
   def update
     @summary = Summary.find(params[:summary_id])
     @post = Post.find(params[:id])
     authorize @post
     
     if @post.update_attributes(params.require(:post).permit(:title, :body))
       flash[:notice] = "Post was updated."
       redirect_to [@summary, @post]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
   end
end
