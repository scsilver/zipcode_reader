json.array!(@zipcodes) do |zipcode|
  json.extract! zipcode, :id, :value, :image_path
  json.url zipcode_url(zipcode, format: :json)
end
