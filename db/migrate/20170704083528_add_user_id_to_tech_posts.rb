class AddUserIdToTechPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :tech_posts, :user_id, :integer
    add_index :tech_posts, :user_id
  end
end
