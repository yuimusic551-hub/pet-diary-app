Rails.application.routes.draw do
  devise_for :users
  
  # トップ画面を homeコントローラーのindexアクションに設定
  root to: "home#index"

  # 日記（ペット）に関する設定
  resources :pets, only: [:new, :create, :index]
end