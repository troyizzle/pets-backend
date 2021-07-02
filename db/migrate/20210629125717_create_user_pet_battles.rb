class CreateUserPetBattles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_pet_battles do |t|
      t.references :winner, null: true, foreign_key: { to_table: :user_pets }
      t.references :opponent, null: false, foreign_key: { to_table: :user_pets }
      t.references :challenger, null: false, foreign_key: { to_table: :user_pets }

      t.timestamps
    end
  end
end
