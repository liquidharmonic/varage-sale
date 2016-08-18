class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :category_id, null: false
      t.integer :seller_id, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.integer :price_in_cents, null: false
      t.string :status, null: false
      t.date :published_date, null: false

      t.timestamps null: false
    end
    add_index :items, :category_id
    add_index :items, :seller_id
  end
end
