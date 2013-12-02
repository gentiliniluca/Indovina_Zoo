json.array!(@tests) do |test|
  json.extract! test, :level
  json.url test_url(test, format: :json)
end
