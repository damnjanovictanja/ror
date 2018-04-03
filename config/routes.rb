Rails.application.routes.draw do
  get 'invitations/index'

  resources :invitations
  
  root 'invitations#index'  
end
