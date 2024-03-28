# == Schema Information
#
# Table name: hotels
#
#  id             :bigint           not null, primary key
#  address        :text             not null
#  name           :string           not null
#  phone          :string           not null
#  price_per_room :decimal(20, 2)   default(0.0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  city_id        :bigint           not null
#
# Indexes
#
#  index_hotels_on_city_id  (city_id)
#
# Foreign Keys
#
#  fk_rails_...  (city_id => cities.id)
#
require "test_helper"

class HotelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
