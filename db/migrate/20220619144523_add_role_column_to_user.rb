# frozen_string_literal: true

class AddRoleColumnToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :string
  end
end