class BlogPost < ApplicationRecord
  has_many :comments
  has_many :blog_post_tags
  has_many :tags, through: :blog_post_tags
end
