json.extract! booking, :id, :check_in, :check_out, :number_of_guests, :number_of_rooms, :paid_status, :status, :total_price
json.hotel do
  json.partial! 'hotels/hotel', hotel: booking.hotel
end
json.user do
  json.partial! 'users/user', user: booking.user
end
