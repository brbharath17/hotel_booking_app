FactoryBot.define do
  factory :booking do
    hotel { create(:hotel) }
    user { create(:user) }
    check_in { Date.today }
    check_out { check_in + 3.days }
    number_of_rooms { 1 }
    number_of_guests { 2 }
  end
end
