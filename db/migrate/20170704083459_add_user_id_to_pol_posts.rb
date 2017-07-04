class AddUserIdToPolPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :pol_posts, :user_id, :integer
    add_index :pol_posts, :user_id
  end
end
