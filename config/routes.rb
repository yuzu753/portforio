Rails.application.routes.draw do
  # デバイス
  devise_for :users
  # トップ
  root 'tops#top'
  get 'tops/top', to: 'tops#top'
  # チャット
  resources :chat
  post 'chat_room/:user_id', to: 'chat_rooms#create', as: 'create_chat_room'

  # 投稿関係
  resources :recruitments
  get 'confirmation', to: 'recruitments#confirmation'
  get 'complete', to: 'recruitments#complete'

  # ユーザー関係
  resources :users do
  get 'log', to: 'users#log', on: :member
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
