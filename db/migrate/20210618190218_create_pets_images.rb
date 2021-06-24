class CreatePetsImages < ActiveRecord::Migration[6.1]
  def change
    create_table :pets_images do |t|
      t.references :pet, null: false, foreign_key: { to_table: 'pets' }
      t.integer :trait, default: 0
      t.timestamps
    end
  end
end
