class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_save :update_posts_counter

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
