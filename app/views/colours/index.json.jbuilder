json.array!(@colours) do |colour|
  json.extract! colour, :id, :name
  json.url colour_url(colour, format: :json)
end
