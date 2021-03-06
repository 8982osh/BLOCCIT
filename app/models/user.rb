class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

  def admin?
    role == 'admin'
  end
  
  def moderator?
    role == 'moderator'
  end

  def favorited(post)
    favorites.where(post_id: post.id).first
  end

  def voted(post)
    votes.where(post_id: post.id).first
  end

  def self.top_rated
    self.select('users.*') #Select all attributes of the user
        .select('COUNT(DISTINCT comments.id) AS comments_count') #Count comments made by user
        .select('COUNT(DISTINCT posts.id) AS posts_count') #Count posts made by user
        .select('COUNT(DISTINCT comments.id) + COUNT(DISTINCT posts.id) AS rank') #Add comment count to post count and label the sum as "rank"
        .joins(:posts) #Ties posts table to users table, via user_id
        .joins(:comments) #Ties comments table to users table, via user_id
        .group('users.id') #Instructs database to group results so each user will be returned in a distinct row
        .order('rank DESC') #Instructs database to order results in descending order, by the rank that we created in this query. (rank = comment count + post count)
   end
end


