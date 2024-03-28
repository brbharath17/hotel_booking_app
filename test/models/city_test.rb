# == Schema Information
#
# Table name: cities
#
#  id         :bigint           not null, primary key
#  country    :string           not null
#  name       :string
#  state      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_cities_on_name_and_state_and_country  (name,state,country) UNIQUE
#
require "test_helper"

class CityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
