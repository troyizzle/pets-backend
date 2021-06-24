class CreatePetBackgroundQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :pets_background_questions do |t|
      t.string :question, default: "", null: false

      t.timestamps
    end
  end
end
