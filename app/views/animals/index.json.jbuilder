json.array!(@animals) do |animal|
  json.extract! animal, :name
  json.url animal_url(animal, format: :json)
end
