# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :questions

  resources :forms

  resources :checklists
  get "checklists/new" => 'checklists#new', :as => :post

  root to: 'welcome#index'
end
