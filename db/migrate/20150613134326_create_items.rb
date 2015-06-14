class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :name
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
