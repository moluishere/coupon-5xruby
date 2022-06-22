# frozen_string_literal: true

class Coupon < ApplicationRecord
  validates :discount, presence: true, numericality: { greater_than: 0 }
  validates :title, presence: true
  validates :serial, uniqueness: true
  belongs_to :books, optional: true
  before_create :create_serial

  def self.set_coupons
    Coupon.select('serial', 'id')
  end

  private

  def create_serial
    self.serial = SecureRandom.alphanumeric(8) if serial.blank?
  end
end
