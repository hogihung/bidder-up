json.extract! product, :id, :publisher, :title, :reserve_price, :decimal, :quantity, :created_at, :updated_at
json.url product_url(product, format: :json)