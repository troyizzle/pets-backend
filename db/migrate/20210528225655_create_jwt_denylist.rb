class CreateJwtDenylist < ActiveRecord::Migration[6.1]
  def change
    create_table :jwt_denylist do |t|
      t.string :jti, null: false
      t.datetime :expirated_at, null: false
      t.timestamps
    end
    add_index :jwt_denylist, :jti
  end
end
