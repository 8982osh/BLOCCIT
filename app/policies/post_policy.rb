class PostPolicy < ApplicationPolicy
  
  class Scope
    #attr_reader :user, :post
    
    #def initialize(user, post)
    #  @user = user
    #  @post = post
    #end
    
    #display diff sets of posts based on role of user. admin & mods see all posts,
    #members only see their posts, guest see no posts
    if @user.admin? || @user.moderator?
      #@user == 'admin' || @user == 'moderator'
       @posts = Post.all
       authorize @posts
    if @user.member?
      #@user == 'member'
       # @user.posts = Post.find(params[:id])
        authorize @post
    else
        @user == 'guest'
        
    end
    end  
  #end

  def index?
    true
  end
  
end

