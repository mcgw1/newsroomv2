class CreateWnewsPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :wnews_posts do |t|
      t.string :title
      t.text :article
      t.string :image

      t.timestamps
    end
  end
end
