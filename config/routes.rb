require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
  # キューに何が溜まってるか確認できるようにする
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # letter_opener_webに記載してある。↑  development環境ならこのリンクにアクセスするとメール見れるよ。

  devise_for :users
  root to: 'articles#index'
  # root_pathの設定

  resources :articles

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end

  # resourceと単数系であるのは１対１の関係だから！indexいらねえから！

# resourcesは１行だけで、よく使うindex,show,createなど諸々のを設定してくれる
# 一部だけ使うときはこんな感じ↓
# resources :articles, only: [:show, :update]

# articleの下にcommentっていうURLの形にしたい時はdo endで、その中にresourcesを書く、入子構造にする。


  scope module: :apps do
    resources :favorites, only: [:index]
    resource :timeline, only: [:show]
    resource :profile, only: [:show, :edit, :update]
  end



  namespace :api, defaults: {format: :json} do
    scope '/articles/:article_id' do
      resources :comments, only: [:index, :create]
      resource :like, only: [:show, :create, :destroy]
    end
  end
end