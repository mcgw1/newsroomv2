class CreateTechPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :tech_posts do |t|
      t.string :title
      t.text :article
      t.string :image

      t.timestamps
    end
  end
end
