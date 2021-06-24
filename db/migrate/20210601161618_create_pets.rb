class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name, default: '', null: false
      t.timestamps
    end

    add_index :pets, :name, unique: true
  end
end
