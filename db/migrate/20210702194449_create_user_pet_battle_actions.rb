class CreateUserPetBattleActions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_pet_battle_actions do |t|
      t.references :battle, null: false, foreign_key: { to_table: :user_pet_battles }
      t.integer :weapon, default: 0
      t.integer :damage, null: false, default: 0
      t.references :attacker, null: false, foreign_key: { to_table: :user_pets }
      t.references :attackee, null: false, foreign_key: { to_table: :user_pets }
      t.timestamps
    end
  end
end
