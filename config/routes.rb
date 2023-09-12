Rails.application.routes.draw do

  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  # devise_scope :customers do
  #   post 'customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
  # end
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  scope module: :public do
      root to: 'homes#top'
      post 'customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
      get "/about" => "homes#about", as: "about"
      resources :bulletin_boards, only: [:new, :index, :show, :edit, :create, :destroy] do
        resources :comments, only: [:create]
      end
      resources :genres, only: [:index,]
      resources :customers, only: [:index, :show, :edit, :update]
  end

  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
