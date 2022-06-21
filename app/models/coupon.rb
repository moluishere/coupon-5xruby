# frozen_string_literal: true

class Coupon < ApplicationRecord
  validates :discount, presence: true, numericality: { greater_than: 0 }
  validates :title, presence: true
  validates :serial_number, presence: true, uniqueness: true
end
