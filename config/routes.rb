Rails.application.routes.draw do
  
  root to: 'homes#index'
  get 'homes/about'
  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }
  namespace :admin do
   get 'top/top'
    
  end
  
  
  
  devise_for :end_users, controllers: {
    sessions:      'end_users/sessions',
    passwords:     'end_users/passwords',
    registrations: 'end_users/registrations'
  }
  scope module: :public do
    get "/end_users", to: 'end_users#show'
    get '/end_users/edit',to: 'end_users#edit'
    patch '/end_users',to: 'end_users#update'
    get 'end_users/out'
    patch 'end_users/quit'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
