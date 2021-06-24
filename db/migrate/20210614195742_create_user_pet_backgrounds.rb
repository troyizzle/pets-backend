class CreateUserPetBackgrounds < ActiveRecord::Migration[6.1]
  def change
    create_table :user_pet_backgrounds do |t|
      t.references :pet, null: false, foreign_key: { to_table: 'user_pets' }
      t.references :question, null: false, foreign_key: { to_table: 'pets_background_questions' }
      t.references :answer, null: false, foreign_key: { to_table: 'pets_background_answers' }
      t.timestamps
    end
  end
end
