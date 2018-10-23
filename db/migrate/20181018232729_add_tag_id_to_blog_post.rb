class AddTagIdToBlogPost < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_posts, :tag_id, :integer
  end
end
