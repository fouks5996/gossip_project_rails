Rails.application.routes.draw do
  # route vers Welcome
  get 'welcome/:first_name', to: 'welcome#show'

  # route page accueil
  get '/', to: 'index#home'

  # route DYNAMIQUE vers chaque gossip
  get '/gossips/:id', to: 'gossip#show', as: 'gossip'

  # route DYNAMIQUE vers chaque user
  get '/users/:id', to: 'index#user', as: 'user'

  # route page contact
  get '/contact', to: 'index#contact'

  # route page team
  get '/team', to: 'index#team'
end
