class AddUserIdToSportPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :sport_posts, :user_id, :integer
    add_index :sport_posts, :user_id
  end
end
