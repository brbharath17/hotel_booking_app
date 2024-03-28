FactoryBot.define do
  factory :hotel do
    name { Faker::Company.name }
    price_per_room { Faker::Number.between(from: 50, to: 500) }
    city { create(:city) }
    phone { Faker::PhoneNumber.phone_number }
    address { Faker::Address.full_address }
  end
end
