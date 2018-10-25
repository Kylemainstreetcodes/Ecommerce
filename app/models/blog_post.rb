class BlogPost < ApplicationRecord
  has_many :comments
  has_many :blog_post_tags
  has_many :tags, through: :blog_post_tags
  validates :title, presence: true, length: { minimum: 3, maximum: 25 }
  validates :content, presence: true

  def create_tags(input_tag_ids)
    input_tag_ids.each do |tag_id|
       BlogPostTag.create(blog_post_id: id, tag_id: tag_id)
      end
  end

  def update_tags(input_tag_ids)
    submitted_tag_ids = input_tag_ids.map {|tag_id| tag_id.to_i}
    old_tag_ids = tag_ids - submitted_tag_ids
    new_tag_ids = submitted_tag_ids - tag_ids

    old_tag_ids.each do |tag_id|
    BlogPostTag.find_by(blog_post_id: blog_post.id, tag_id: tag_id).destroy
    end

    new_tag_ids.each do |tag_id|
    BlogPostTag.create(blog_post_id: blog_post.id, tag_id: tag_id)
    end
  end
end
