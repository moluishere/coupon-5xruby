class AddColumnToCouponForStatus < ActiveRecord::Migration[6.1]
  def change
    add_column :coupons, :status, :boolean, default: false
  end
end
