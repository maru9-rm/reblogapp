Rails.application.routes.draw do
  root to: 'articles#index'
  # root_pathの設定

  resources :articles
  # １行でよく使うindex,show,createなど諸々のを設定
  # 一部だけ使うときはこんな感じ↓
  # resources :articles, only: [:show, :update]
end
