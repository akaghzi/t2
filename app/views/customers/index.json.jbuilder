json.array!(@customers) do |customer|
  json.extract! customer, :id, :owner, :store, :city, :phone
  json.url customer_url(customer, format: :json)
end
