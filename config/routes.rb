Rails.application.routes.draw do
  resources :users do
    member do
      get 'nishi'
      get 'manav'
    end
    collection do
      get 'nishi_page'
      get 'login_form'
      put 'login_form_validation'
      get 'logout'
      get '/registration',to:'users#new'
    end
  end
  root 'users#login_form'
  get 'auth/:provider/callback', to: 'users#facebook_login'
   get 'products/index'
   resources :products do
    member do
      get 'add_images'
      put 'adding_images'
      get  'trans'
      put  'trans_pay'
    end
  end
 end
