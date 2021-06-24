class CreatePetBackgroundAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :pets_background_answers do |t|
      t.string :answer, null: false
      t.references :question, null: false, foreign_key: { to_table: 'pets_background_questions' }

      t.timestamps
    end
  end
end
