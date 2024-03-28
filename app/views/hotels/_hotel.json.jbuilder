json.extract! hotel, :id, :name, :address, :phone
json.city do
  json.extract! hotel.city, :id, :name, :state, :country
end
