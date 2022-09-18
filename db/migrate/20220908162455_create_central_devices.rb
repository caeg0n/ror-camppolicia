class CreateCentralDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :central_devices do |t|
      t.string :device_id
      t.integer :state

      t.timestamps
    end
  end
end
