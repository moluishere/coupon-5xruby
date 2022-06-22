class AddColumnToBookForFinalPrice < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :final_price, :integer
  end
end
