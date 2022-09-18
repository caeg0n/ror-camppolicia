class AddNameToCitizenDevices < ActiveRecord::Migration[6.0]
  def change
    add_column :citizen_devices, :name, :string
  end
end
