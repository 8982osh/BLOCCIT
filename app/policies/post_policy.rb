class PostPolicy < ApplicationPolicy
  
  def index?
    true
  end

  class Scope
    attr_reader :user, :scope
    
    def initialize(user, scope)
        @user = user
        @scope = scope
    end
      
      #display diff sets of posts based on role of user. admin & mods see all posts,
      #members only see their posts, guest see no posts
    def resolve
      if @user.admin? || @user.moderator?
         #@user == 'admin' || @user == 'moderator'
         scope.all
      else
         #@user == 'member'
         scope.where(user: user)
      end
    end
  end
end
