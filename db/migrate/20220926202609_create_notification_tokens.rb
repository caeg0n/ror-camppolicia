class CreateNotificationTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :notification_tokens do |t|
      t.string :device_id
      t.string :token
      t.integer :device_class

      t.timestamps
    end
  end
end
