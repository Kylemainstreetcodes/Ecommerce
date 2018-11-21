class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog_post
  validates :blog_post, presence: true
  validates :user, presence: true
  validates :content, presence: true
end
