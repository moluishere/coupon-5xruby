FactoryBot.define do
  factory :book do
    title { Faker::Name.name }
    price { Faker::Number.between(from: 100, to: 500) }
  end
end
