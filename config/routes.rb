# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :authors

  namespace :authors do
    root to: 'home#index'
  end

  get 'home/index'
  root to: 'readers/home#index'

  # Readers::PostsController
  get '/blog/:id' => 'readers/posts#show', as: :blog_post

  # Authors::PostsController
  scope module: 'authors' do
    resources :posts do
      resources :elements
    end
  end
end
