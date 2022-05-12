Rails.application.routes.draw do
  get '/', to: 'index#home'
  
  resources :gossips do
    resources :comments
  end

  resources :gossips do
    resources :likes
  end

  resources :users
  resources :city

  #sessions
	get '/login'     => 'sessions#new'
	post '/login'    => 'sessions#create'
	delete '/logout' => 'sessions#destroy'  

  #Likes
  # put '/gossips/:id/like', to: 'gossips#like', as: 'like'

  get 'welcome/:first_name', to: 'welcome#show'
  get '/contact', to: 'index#contact'
  get '/team', to: 'index#team'
end
