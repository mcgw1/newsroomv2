class AddAttachmentPostImgToTechPosts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :tech_posts do |t|
      t.attachment :post_img
    end
  end

  def self.down
    remove_attachment :tech_posts, :post_img
  end
end
