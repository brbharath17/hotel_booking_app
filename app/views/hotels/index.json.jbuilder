json.status "success"
json.data do
  json.array! @hotels do |hotel|
    json.partial! hotel, hotel: hotel
  end
end
