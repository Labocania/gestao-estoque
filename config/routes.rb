Rails.application.routes.draw do


  resources :products, only: [:create, :new, :index] do
    resources :factories, only: [:new, :create]
    resources :sales, only: [:new, :create]
  end

=begin

             Prefix Verb URI Pattern                                   Controller#Action
  product_factories POST /products/:product_id/factories(.:format)     factories#create
new_product_factory GET  /products/:product_id/factories/new(.:format) factories#new
      product_sales POST /products/:product_id/sales(.:format)         sales#create
   new_product_sale GET  /products/:product_id/sales/new(.:format)     sales#new
           products GET  /products(.:format)                           products#index
                    POST /products(.:format)                           products#create
        new_product GET  /products/new(.:format)                       products#new
        
=end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
