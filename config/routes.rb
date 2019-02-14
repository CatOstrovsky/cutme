Rails.application.routes.draw do
   resources :links

   match '/@:short', to: 'cutme#index', via: :all

   get '/analytics/:link_id', to: 'analytics#index'

   root :to => 'homepage#index'
end
