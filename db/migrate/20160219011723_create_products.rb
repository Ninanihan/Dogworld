class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :age
      t.integer :gender
      t.string :breeds
      t.string :city
      t.string :price
      t.text :description
      t.integer :user_id
      t.string :user_email

      t.timestamps null: false
    end
  end
end
