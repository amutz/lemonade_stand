json.array!(@sales) do |sale|
  json.extract! sale, :id, :quantity, :price, :customer
  json.url sale_url(sale, format: :json)
end
