class AddAttachmentPostImgToWnewsPosts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :wnews_posts do |t|
      t.attachment :post_img
    end
  end

  def self.down
    remove_attachment :wnews_posts, :post_img
  end
end
