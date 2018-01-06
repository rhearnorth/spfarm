json.extract! order, :id, :hash_rate, :price, :user_id, :confirmed_at, :confirmed_by_user_id, :slip_image, :created_at, :updated_at
json.url order_url(order, format: :json)
