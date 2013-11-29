json.array!(@questions) do |question|
  json.extract! question, :value
  json.url question_url(question, format: :json)
end
