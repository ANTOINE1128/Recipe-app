class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurement_unit
      t.decimal :price, default 0
      t.integer :quantity, default 0
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :foods, :name
    add_index :foods, :user_id
  end
end
