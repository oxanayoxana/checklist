# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :questions

  resources :checklists do
    resource :questions, only: [:index] do
      resources :answers
    end
  end

  # resources :forms do
  #   resources :answers
  # end

  resources :forms do
    resource :questions do
      resources :answers
    end
  end

  resources :forms do
    resource :questions do
      resources :answers
    end
  end


  root to: 'welcome#index'
end
