Rails.application.routes.draw do
  namespace :admin do
    get '/',to: 'top#top'
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :items
    resources :genres, only:[:index, :show, :edit, :update, :create]
  end
  root to: 'homes#index'
  get 'homes/about'
  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }
  devise_for :end_users, controllers: {
    sessions:      'end_users/sessions',
    passwords:     'end_users/passwords',
    registrations: 'end_users/registrations'
  }
  scope module: :public do
    get '/end_user',to: 'end_users#show'
    get '/end_user/edit',to: 'end_users#edit'
    patch '/end_user',to: 'end_users#update'
    get 'end_user/out',to: 'end_users#out'
    patch 'end_user/quit',to: 'end_users#quit'
    resources :items, only:[:index, :show]
    resources :cart_items, only:[:index, :create, :update, :destroy]
    delete '/cart_items', to: 'cart_items#destroy_all', as: 'all_destroy'
    resources :orders, only:[:index, :new, :show, :create]
    get '/orders/confirm',to: 'orders#confirm'
    get '/orders/done',to: 'orders#done'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
