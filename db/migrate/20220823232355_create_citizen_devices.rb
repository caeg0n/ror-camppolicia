class CreateCitizenDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :citizen_devices do |t|
      t.string :device_id
      t.integer :state
      t.string :nick
      t.string :cel

      t.timestamps
    end
  end
end
