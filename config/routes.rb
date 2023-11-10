# frozen_string_literal: true

Rails.application.routes.draw do
  resources :pix, only: [:index, :create, :destroy]

  root 'pix#index'
end
