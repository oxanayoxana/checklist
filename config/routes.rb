# frozen_string_literal: true

Rails.application.routes.draw do
  resources :projects
  resources :questions

  resources :checklists do
    resource :questions, only: [:index] do
      resources :answers
    end
  end

  resources :checklists do
    resources :questions, only: [:index] do
      resources :answers
    end
  end

  root to: 'welcome#index'
end
