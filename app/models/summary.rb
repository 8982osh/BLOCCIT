class Summary < ActiveRecord::Base
  has_many :posts
  # belongs_to AND the summaries table needs a post_id column  
end
