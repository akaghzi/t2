json.array!(@products) do |product|
  json.extract! product, :id, :code, :specification, :price
  json.url product_url(product, format: :json)
end
