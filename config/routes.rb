Rails.application.routes.draw do
  #get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'post_images#index'
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  resource :favorites, only: [:create, :destroy]#いいねのルート　showページもidの受け渡しもないので単数形
  resources :post_comments, only: [:create, :destroy]#画像にコメント投稿する時のルーティングの記述'do'から。
  end
  resources :users, only: [:show, :edit, :update]#このeditはユーザー編集ページのedit
end
