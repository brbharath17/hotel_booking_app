json.status 'success'
json.data do
  json.partial! 'bookings/booking', booking: @booking
end
