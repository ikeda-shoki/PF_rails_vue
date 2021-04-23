class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user,        null: false
      t.string :title,           null: false
      t.text :post_introduction
      t.integer :post_genre,     nill: false, default: 0

      t.timestamps
    end
  end
end
