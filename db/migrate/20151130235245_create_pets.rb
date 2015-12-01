class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :nickname
      t.integer :age
      t.string :gender
      t.string :breeds
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :pets, [:user_id, :created_at]
  end
end
