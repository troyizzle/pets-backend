class CreateUserPetFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :user_pet_foods do |t|
      t.references :food, null: false, foreign_key: { to_table: :pets_foods }
      t.references :pet, null: false, foreign_key: { to_table: :user_pets }
      t.integer :rarity, default: 0, null: false
      t.integer :weight, default: 0, null: false
      t.integer :hunger, default: 0, null: false
      t.integer :value, default: 0, null: false
      t.timestamp :last_decay_at, null: true

      t.timestamps
    end
  end
end
