# frozen_string_literal: true

class Coupon < ApplicationRecord
  belongs_to :users, optional: true
end
