# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :orders, optional: true
end
