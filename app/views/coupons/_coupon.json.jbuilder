# frozen_string_literal: true

json.extract! coupon, :id, :title, :discount_description, :discount, :created_at, :updated_at
json.url coupon_url(coupon, format: :json)
