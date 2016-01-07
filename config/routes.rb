Rails.application.routes.draw do

  #SESSIONS

   get 'login' => 'sessions#new', as: :login_form

   post 'login' => 'sessions#create'

   delete 'logout' => 'sessions#destroy', as: :sessions

  # ##USERS
   get '/users/new' => 'users#new', as: :new_user

   get '/users' => 'users#index', as: :users

   post '/users' => 'users#create'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root 'workouts#login'

   get '/users/:user_id/workouts/new' => 'workouts#new', as: :new_user_workout

   post '/users/:user_id/workouts' => 'workouts#create'

   get '/users/:user_id/workouts' => 'workouts#index', as: :user_workouts

   get '/users/:user_id/workouts/:id' => 'workouts#show', as: :user_workout

   get '/users/:user_id/workouts/:id/edit' => 'workouts#edit', as: :edit_user_workout

   patch '/users/:user_id/workouts/:id' => 'workouts#update'

   delete '/users/:user_id/workouts/:id' => 'workouts#destroy'

   #get '/search' => 'workouts#forsearch', as: :search

   get 'users/:user_id/exercises' => 'workouts#forsearch', as: :search

  #######################

   get '/users/:user_id/workouts/:workout_id/exercises/new' => 'exercises#new', as: :new_user_workout_exercise

   post '/users/:user_id/workouts/:workout_id/exercises' => 'exercises#create'

   get '/users/:user_id/workouts/:workout_id/exercises/' => 'exercises#index', as: :user_workout_exercises

   get '/users/:user_id/workouts/:workout_id/exercises/:id' => 'exercises#show', as: :user_workout_exercise

   get '/users/:user_id/workouts/:workout_id/exercises/:id/edit' => 'exercises#edit', as: :edit_user_workout_exercise

   patch '/users/:user_id/workouts/:workout_id/exercises/:id' => 'exercises#update'


   delete '/users/:user_id/workouts/:workout_id/exercises/:id' => 'exercises#destroy'


 # resources :users do
 #   resources :workouts do 
  #    resources :exercises do 
  #    end
  #  end
  #end



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
