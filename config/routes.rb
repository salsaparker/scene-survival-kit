Rails.application.routes.draw do


 devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'events#index'
  resources :addresses
  resources :events
  resources :musicians
  resources :profiles
  resources :venue_reps

  # get 'venue_reps/index'

  # get 'venue_reps/new'

  # get 'venue_reps/show'

  # get 'venue_reps/edit'

 #  get 'profiles/index'

 #  get 'profiles/new'

 #  get 'profiles/edit'

 #  get 'profiles/show'

  # get 'musicians/index'

  # get 'musicians/new'

  # get 'musicians/show'

  # get 'musicians/edit'

  # get 'events/index'

  # get 'events/show'

  # get 'events/new'

  # get 'events/edit'

  # get 'addresses/index'

  # get 'addresses/show'

  # get 'addresses/new'

  # get 'addresses/edit'

 
  

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
