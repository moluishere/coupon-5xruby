class AddColumnToBookForApplyCoupon < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :apply_coupon, :string
  end
end
