# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :coupons
  before_create :set_as_admin

  def set_as_admin
    self.role = 'admin' if User.count.zero?
  end

  def admin?
    role == 'admin'
  end
end
