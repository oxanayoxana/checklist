# frozen_string_literal: true

Rails.application.routes.draw do
  resources :projects
  resources :questions

  resources :checklists do
    resources :answers
  end

  root to: 'welcome#index'
end
