json.array!(@numbers) do |number|
  json.extract! number, :id, :value, :image_path
  json.url number_url(number, format: :json)
end
