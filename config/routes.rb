Rails.application.routes.draw do
  devise_for :users
  root 'office_hours#index'

  resources :office_hours

  # Building and Department resources will have an autocomplete
  # route for AJAX get requests.
  get '/buildings/autocomplete', to: 'buildings#autocomplete'
  get '/departments/autocomplete', to: 'departments#autocomplete'

  namespace :admin do
    resources :departments, :office_hours, :buildings
    resources :members do
      collection { get :upload }
      collection { post :import }
    end
  end
end
