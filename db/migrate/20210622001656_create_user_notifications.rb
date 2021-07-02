class CreateUserNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :user_notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :message, null: false, default: ''
      t.integer :status, default: 0
      t.references :notifiable, polymorphic: true
      t.timestamps
    end
  end
end
