class PostPolicy < ApplicationPolicy
  
  #class Scope
  #  attr_reader :user, :post
    
  #  def initialize(user, post)
  #    @user = user
  #    @post = post
  #  end
    
    #display diff sets of posts based on role of user. admin & mods see all posts,
    #members only see their posts, guest see no posts
  def resolve
    if @user.admin? || @user.moderator?
       #@user == 'admin' || @user == 'moderator'
       scope.all
    else @user.member?
       #@user == 'member'
       scope.where(user: user)
    #else
    #   flash[:notice] = "Guests do not have access to view posts."
    #end
    end
  end
 

  def index?
    true
  end
end
