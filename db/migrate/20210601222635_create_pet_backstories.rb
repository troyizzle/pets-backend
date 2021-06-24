class CreatePetBackstories < ActiveRecord::Migration[6.1]
  def change
    create_table :pets_backstories do |t|
      t.references :pet, null: false, foreign_key: { to_table: 'pets' }
      t.string :body, null: false

      t.timestamps
    end
  end
end
