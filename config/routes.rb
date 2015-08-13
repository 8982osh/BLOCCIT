Rails.application.routes.draw do

  #get 'advertisement/index'

  #get 'advertisement/show'
  
  resources :advertisement

  resources :posts

  get 'about' => 'welcome#about'

  root to: 'welcome#index#contact'
end
