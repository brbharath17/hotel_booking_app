# == Schema Information
#
# Table name: rooms
#
#  id         :bigint           not null, primary key
#  beds       :integer          not null
#  floor      :integer          not null
#  number     :string           not null
#  price      :decimal(15, 2)   not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  hotel_id   :bigint           not null
#
# Indexes
#
#  index_rooms_on_hotel_id             (hotel_id)
#  index_rooms_on_hotel_id_and_number  (hotel_id,number) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (hotel_id => hotels.id)
#
require "test_helper"

class RoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
