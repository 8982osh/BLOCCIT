Rails.application.routes.draw do
 #Failure/Error: <p><%= link_to 'Confirm my account', confirmation_url(@resource, confirmation_token: @token) %></p>
 #ActionView::Template::Error:
 # Missing host to link to! Please provide the :host parameter, set default_url_options[:host], or set :only_path to true 
 default_url_options :host => "test@example.com" #Added to solve confirmation email error

  get 'comments/create'

  devise_for :users
  resources :users, only: [:update, :show]
  
#  resources :topics do
#    resources :posts, except: [:index] do #nest comments under posts, only create routes needed
#      resources :comments, only: [:create, :destroy] 
#    end
#  end

  resources :topics do
    resources :posts, except: [:index]
  end
  
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
 
  
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' =>'votes#down_vote', as: :down_vote
  end
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  end

