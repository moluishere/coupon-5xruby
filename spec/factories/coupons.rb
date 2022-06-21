FactoryBot.define do
  factory :coupon do
    title { Faker::Name.name }
    discount_description { Faker::Lorem.paragraph }
    discount { Faker::Number.between(from: 100, to: 500) }
  end
end
