class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :topic
  belongs_to :summary
  # Summary.find_by(post_id: 1)
  
  default_scope { order('created_at DESC')}
end


