Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  # root_pathの設定

  resources :articles do
    resources :comments, only: %i[new create]

    resource :like, only: %i[create destroy] # likeのIDを指定しなくていいようにresource
  end

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end

  resources :favorites, only: [:index]

  resource :profile, only: %i[show edit update]
  # resourceと単数系であるのは１対１の関係だから！indexいらねえから！
end

# resourcesは１行だけで、よく使うindex,show,createなど諸々のを設定してくれる
# 一部だけ使うときはこんな感じ↓
# resources :articles, only: [:show, :update]

# articleの下にcommentっていうURLの形にしたい時はdo endで、その中にresourcesを書く、入子構造にする。
