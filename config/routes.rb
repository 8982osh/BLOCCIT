Rails.application.routes.draw do

  #get 'questions/create'

  #get 'questions/update'

  #get 'questions/destroy'

  #get 'questions/index'

  #get 'questions/show'

  #get 'questions/new'

  #get 'questions/edit'
  
  resources :questions

  resources :posts
  
  #match 'todos/complete' => 'todos#complete', :via => :post

  get 'about' => 'welcome#about'

  root to: 'welcome#index#contact'
end
