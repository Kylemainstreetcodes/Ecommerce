class Tag < ApplicationRecord
  has_many :blog_posts_tags
  has_many :blog_posts, through: :blog_posts_tags
end
