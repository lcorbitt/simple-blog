# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :authors
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  # Authors::PostsController
  scope module: 'authors' do
    resources :posts
  end
end
