# frozen_string_literal: true

Rails.application.routes.draw do
  resources :checklists
  
  root to: 'checklists#index'
end
