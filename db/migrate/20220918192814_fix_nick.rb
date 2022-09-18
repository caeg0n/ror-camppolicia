class FixNick < ActiveRecord::Migration[6.0]
  def self.up 
    rename_column :citizen_devices, :nick, :reference  
  end  
end
