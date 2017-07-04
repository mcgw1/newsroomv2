class AddUserIdToWnewsPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :wnews_posts, :user_id, :integer
    add_index :wnews_posts, :user_id
  end
end
