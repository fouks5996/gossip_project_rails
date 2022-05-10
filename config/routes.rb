Rails.application.routes.draw do
  get '/', to: 'index#home'
  
  resources :gossips

  resources :user

  resources :city

  get 'welcome/:first_name', to: 'welcome#show'
  get '/contact', to: 'index#contact'
  get '/team', to: 'index#team'
end
