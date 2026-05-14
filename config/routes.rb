Rails.application.routes.draw do
  devise_for :users
  
  root to: "home#index"

  # ペットの登録・一覧
  resources :pets, only: [:new, :create, :index]

  # 日記の管理（diaries/index だけでなく、作成や保存も一気にセット。こちらがおすすめ）
  resources :diaries
end