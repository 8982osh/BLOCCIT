class FavoritesController < ApplicationController

	def create
	  post = Post.find(params[:post_id])
	  favorite = current_user.favorites.build(post: post)
      authorize favorite
	  
	  if favorite.save
	  	#Add code to gen a success flash & redirect to post
	  	flash[:notice] = "Favorite was saved successfully."
	  	#Remember path shortcut: [post.topic, post]
	  	redirect_to [post.topic, post]
	  else
	  	#Add code to gen failure flash & redirect to post
	  	flash[:error] = "There was an error saving the Favorite. Please try again."
        #redirect_to post
        redirect_to [post.topic, post]
	  end
	end

	def destroy
	  #Get post from params
	  post = Post.find(params[:id])
	  #Find current user's fav with Id in params
	  favorite = current_user.favorites.find(params[:id])
      authorize favorite

	  if favorite.destroy
		#Flash success & redirect to @post
		flash[:notice] = "Favorite was deleted successfully."
        #redirect_to post
        redirect_to [post.topic, post]
	  else
		#Flash error & redirect to @post
		flash[:error] = "Error deleting your. Please try again."
        #redirect_to post
        redirect_to [post.topic, post]
	  end
	end
end
