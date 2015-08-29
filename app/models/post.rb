class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  
  default_scope { order('created_at DESC')}
  #end

  
  scope :ordered_by_title, -> { where(title: true) }
  scope :ordered_by_reverse_created_at, -> { where(created_at: true) }
  #scope :ordered_by_reverse_created_at, -> { where (created_at.first) }
  #scope :ordered_by_reverse_created_at, -> { order("reverse_created_at") }
  #end

  #scope :ordered_by_title, -> { where(title: true) }
  #scope :ordered_by_reverse_created_at, -> { order("reverse_created_at") }
end
  