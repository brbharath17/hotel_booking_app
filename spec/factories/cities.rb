FactoryBot.define do
  factory :city do
    country { Faker::Address.country }
    name { Faker::Address.city }
    state { Faker::Address.state }
  end
end
