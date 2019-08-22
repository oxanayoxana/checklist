# frozen_string_literal: true

Rails.application.routes.draw do
  get 'questions/index'
  resources :projects
  resources :checklists
  
  root to: 'welcome#index'
end
