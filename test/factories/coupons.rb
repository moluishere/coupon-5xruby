# frozen_string_literal: true

FactoryBot.define do
  factory :coupon do
    title { 'MyString' }
    discount_description { 'MyString' }
    discount { 1 }
  end
end
