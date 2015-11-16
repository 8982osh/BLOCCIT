class PostPolicy < ApplicationPolicy

  def index?
    true
  end
  
  def destory?
    user.present? && (record.user == user || user.admin? || user.moderator?)
  end
  
end

