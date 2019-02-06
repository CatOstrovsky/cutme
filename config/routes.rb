Rails.application.routes.draw do
   resources :links

   match '/@:short', to: 'cutme#index', via: :all

   root :to => 'links#index'
end
