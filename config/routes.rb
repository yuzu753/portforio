Rails.application.routes.draw do
  root 'tops#top'
  get 'tops/top', to: 'tops#top'
  resources :chat, only: [:index, :only, :show]
  resources :recruitments
  get 'confirmation', to: 'recruitments#confirmation'
  get 'complete', to: 'recruitments#complete'
  resources :users
  get 'log', to: 'users#log'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
