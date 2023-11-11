# frozen_string_literal: true

Rails.application.routes.draw do
  resources :transaction, only: [:index, :create, :destroy]
  resources :pix, only: [:index, :create, :destroy]

  root 'pix#index'
end
