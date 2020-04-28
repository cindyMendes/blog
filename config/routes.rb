Rails.application.routes.draw do
  resources :customers
  resources :posts do
     resources :comments
   end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #ALL OF THIS CODE BELOW CAN BE REPLACED BY: resources :pages
    # get '/pages', to: 'pages#index'
    # post '/pages', to: 'pages#create'
    # get '/pages/new', to: 'pages#new', as: 'new_page'
    # get '/pages/:id', to: 'pages#show', as: 'page'
    # get '/pages/:id/edit', to: 'pages#edit', as: 'edit_page'
    # patch '/pages/:id', to: 'pages#update'
    # delete '/pages/:id', to: 'pages#destroy'

  resources :pages
end
