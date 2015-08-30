class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  
  default_scope { order('created_at DESC')}
  #end

  scope :ordered_by_title, -> { order(:title) }
  #scope :ordered_by_reverse_created_at, -> { order(:reverse_created_at) }
  scope :ordered_by_reverse_created_at, -> { order(:created_at) }
end
  