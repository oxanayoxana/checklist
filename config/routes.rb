# frozen_string_literal: true

Rails.application.routes.draw do
  resources :projects
  resources :checklists
  resources :questions

  root to: 'welcome#index'
end
