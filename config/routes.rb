# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :questions

  resources :forms

  resources :checklists, only: [:index, :create, :new, :edit, :update, :destroy]

  get "checklists/build", to: 'checklists#build', as: :build_checklist

  root to: 'welcome#index'
end
