class Order < ApplicationRecord
  belongs_to :users, optional: true
end
