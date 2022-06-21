# frozen_string_literal: true

class Coupon < ApplicationRecord
  belongs_to :users, optional: true
  validates :discount, presence: true, numericality: { greater_than: 0 }
  validates :title, presence: true, uniqueness: { scope: :user_id }
end
