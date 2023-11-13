# frozen_string_literal: true

Rails.application.routes.draw do
  resources :pix, only: %i[index create destroy]
  resources :transaction, only: %i[index create destroy]
  get 'transaction/search/:id', to: 'transaction#search'
end
