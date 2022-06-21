class ChangeColumnTypeForSerialToString < ActiveRecord::Migration[6.1]
  def change
    change_column :coupons, :serial_number, :string
    rename_column :coupons, :serial_number, :serial
  end
end
