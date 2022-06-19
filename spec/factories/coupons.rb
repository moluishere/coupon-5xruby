FactoryBot.define do
  factory :coupon do
    title { "MyString" }
    discount_description { "MyString" }
    discount { 1 }
    users { nil }
  end
end
