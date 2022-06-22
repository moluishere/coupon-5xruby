# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :books do
    member do
      post :apply_coupon
    end
  end

  resources :coupons

  root 'homepage#index'
end
