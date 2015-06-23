class CreateCategoriesUsers < ActiveRecord::Migration
  def change
    create_table :category_users do |t|
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end

    add_index :category_users, [:user_id, :category_id], unique: true

  end
end
