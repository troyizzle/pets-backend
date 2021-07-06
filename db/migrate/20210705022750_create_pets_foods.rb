class CreatePetsFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :pets_foods do |t|
      t.integer :rarity, default: 0, null: false
      t.integer :weight, default: 0, null: false
      t.integer :value, default: 0, null: false
      t.integer :hunger, default: 0, null: false
      t.integer :decay_rate, default: 0, null: false

      t.timestamps
    end
  end
end
