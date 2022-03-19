# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :movies, only: %i[create destroy] do
    member do
      resource :like, only: :update, controller: 'movies/likes', as: :like_movie
      resource :dislike, only: :update, controller: 'movies/dislikes', as: :dislike_movie
    end
  end
end
