class AddAttachmentPostImgToSportPosts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :sport_posts do |t|
      t.attachment :post_img
    end
  end

  def self.down
    remove_attachment :sport_posts, :post_img
  end
end
