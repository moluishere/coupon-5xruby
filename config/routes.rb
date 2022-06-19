# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :coupons

  resources :orders, except: [:edit] do
    member do
      get :checkout
      post :pay
      delete :cancel
    end
  end

  root 'homepage#index'
end
