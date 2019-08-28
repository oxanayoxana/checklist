# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :projects
  resources :questions

  resources :checklists do
    resource :questions, only: [:index] do
      resources :answers
    end
  end

  resources :forms do
    resources :answers
  end

  root to: 'welcome#index'
end
