class AddAttachmentPostImgToPolPosts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :pol_posts do |t|
      t.attachment :post_img
    end
  end

  def self.down
    remove_attachment :pol_posts, :post_img
  end
end
