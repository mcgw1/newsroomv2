class CreateAllposts < ActiveRecord::Migration[5.1]
  def change
    create_table :allposts do |t|
      t.string :title
      t.text :article
      t.string :image

      t.timestamps
    end
  end
end
