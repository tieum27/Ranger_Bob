Rails.application.routes.draw do
  resources :animals
  resources :sigthings do
    get :get_events, on: :collection
  end
  root 'animals#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #generates /concerts/get_events route
end
