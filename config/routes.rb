Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  resources :users
  resources :visits, except: [:edit, :update]
  resources :doctors
  root 'clinic#index', as: 'clinic_index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
