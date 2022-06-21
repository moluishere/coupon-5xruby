# frozen_string_literal: true

class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.string :title
      t.string :discount_description
      t.integer :discount
      t.integer :serial_number

      t.timestamps
    end
  end
end
