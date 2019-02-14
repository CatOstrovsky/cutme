class AddDeviceTypeColumn < ActiveRecord::Migration[5.2]
  def change

    add_column :clicks, :device_type, :string
  end
end
