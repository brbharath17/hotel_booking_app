json.status 'success'
json.data do
  json.array! @bookings do |booking|
    json.partial! 'bookings/booking', booking: booking
  end
end
