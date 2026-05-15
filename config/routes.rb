# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  # 🐾 ペットの年齢早見表ページを追加
  get 'age_chart', to: 'diaries#age_chart'

  # ペットの登録・一覧
  resources :animals, only: %i[new create index destroy]

  # 日記の管理
  resources :diaries
end
