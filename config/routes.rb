Rails.application.routes.draw do
  get '/', to: 'index#home'
  
  resources :gossips do
    resources :comments
  end

  resources :users

  #sessions
	get '/login'     => 'sessions#new'
	post '/login'    => 'sessions#create'
	delete '/logout' => 'sessions#destroy'  

  resources :city

  get 'welcome/:first_name', to: 'welcome#show'
  get '/contact', to: 'index#contact'
  get '/team', to: 'index#team'
end
