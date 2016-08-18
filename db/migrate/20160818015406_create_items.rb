class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :category_id
      t.integer :seller_id
      t.string :title
      t.text :description
      t.integer :price_in_cents
      t.string :status
      t.date :published_date

      t.timestamps null: false
    end
    add_index :items, :category_id
    add_index :items, :seller_id
  end
end
