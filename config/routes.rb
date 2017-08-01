Rails.application.routes.draw do
  
get 'welcome/index'

 

 resources :projects
 resources :users
 resources :tasks

 root 'welcome#index'

end
