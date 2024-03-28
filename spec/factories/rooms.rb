FactoryBot.define do
  factory :room do
    hotel { create(:hotel) }
  end
end
