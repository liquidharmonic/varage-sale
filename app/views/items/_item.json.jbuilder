json.extract! item, :id, :category_id, :seller_id, :description, :price_in_cents, :status, :published_date, :created_at, :updated_at
json.url item_url(item, format: :json)