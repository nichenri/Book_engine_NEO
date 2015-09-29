Rails.application.routes.draw do
  root 'users/top#index'
  namespace :users do
   get 'top/index'
    resources :borrowing_histories, only: [:index]
    resources :books, only: [:show] do
      resources :book_reservations
      resources :reviews, only: [:create, :update, :edit, :destroy]
      resources :bookmarks, only: [:create, :destroy]
      resources :stocks, only: [:show] do
        resources :stock_reservations
        resources :borrowings
        resources :borrowing_histories, except: [:index]
      end
    end
    resources :new_books, only: [:new, :create] do
      resources :additions, only: [:create]  
    end
  end

  namespace :admins do
    get 'top/index'
    resources :borrowings, only: [:index, :create]
    resources :borrowing_histories, only: [:index, :create]
    resources :bookmarks, only: [:index]
    resources :authors, except: [:show]
    resources :genres, except: [:show]
    resources :publishers, except: [:show]
    resources :additions, only: [:delete]
    resources :addition_histories, only: [:create]
    resources :new_books, only: [:index]
    resources :books, except: [:index] do
      resources :book_reservations
      resources :stocks, only: [:create, :destroy] do
        resources :stock_reservations
      end
    end
  end


  devise_for :admins, :controllers => {
    :sessions      => "admins/sessions",
    :registrations => "admins/registrations",
    :passwords     => "admins/passwords"
  }

  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords"
  }


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
