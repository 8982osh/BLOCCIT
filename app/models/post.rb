class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  
  default_scope { order('created_at DESC')}
  #end

  
  scope :ordered_by_title, -> { where(title: 'title') }
  scope :ordered_by_reverse_created_at, -> { where(created_at: 'datetime') }
end
  