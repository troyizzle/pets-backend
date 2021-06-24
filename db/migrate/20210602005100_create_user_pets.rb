class CreateUserPets < ActiveRecord::Migration[6.1]
  def change
    create_table :user_pets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pet, null: false, foreign_key: true
      t.string :name, null: false, default: ''
      t.string :gender, null: false, default: ''
      t.integer :health, null: false, default: 0
      t.integer :attack, null: false, default: 0
      t.integer :hunger, null: false, default: 0
      t.timestamps
    end
  end
end
