# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :books

  resources :coupons do
    post :apply_coupon
  end

  root 'homepage#index'
end
