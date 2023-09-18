Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

#ゲストログイン
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  scope module: :public do
      root to: 'homes#top'
      get "/about" => "homes#about", as: "about"
      resources :bulletin_boards, only: [:new, :index, :show, :edit, :create, :destroy] do
        resource :favorites, only: [:new,:create, :destroy]
        resources :comments, only: [:create]
      end
      get '/favorited_bulletin_boards', to: 'favorites#index', as: 'favorited_bulletin_boards'
      resources :genres, only: [:index,]
      resources :customers, only: [:index, :show, :edit, :update]
      # 論理削除用のルーティング
      patch  '/customers/withdraw' => 'customers#withdraw'
  end

  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
