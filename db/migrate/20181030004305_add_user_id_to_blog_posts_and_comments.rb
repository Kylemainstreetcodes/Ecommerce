class AddUserIdToBlogPostsAndComments < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_posts, :user_id, :integer
    add_column :comments, :user_id, :integer
    remove_column :comments, :username, :string
  end
end
