Rails.application.routes.draw do

  #SESSIONS

  get 'login' => 'sessions#new', as: :login_form

  post 'login' => 'sessions#create'

  delete 'sessions' => 'sessions#destroy'

  ##USERS
  get 'signup' => 'users#new', as: :new_user

  post 'signup/' => 'users#create'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root 'workouts#login'

  get '/workouts/new' => 'workouts#new', as: :new_workout

  post '/workouts' => 'workouts#create'

  get '/workouts' => 'workouts#index', as: :index

  get '/workouts/:id' => 'workouts#show', as: :workout

  get '/workouts/:id/edit' => 'workouts#edit', as: :edit_workout

  patch 'workouts/:id' => 'workouts#update'

  delete 'workouts/:id' => 'workouts#destroy'

  get '/search' => 'workouts#forsearch', as: :search

  #######################

  get 'workouts/:workout_id/exercises/new' => 'exercises#new', as: :new_workout_exercise

  post 'workouts/:workout_id/exercises' => 'exercises#create'

  get 'workouts/:workout_id/exercises' => 'exercises#index', as: :workout_exercises

  get 'workouts/:workout_id/exercises/:id' => 'exercises#show', as: :workout_exercise

  get 'workouts/:workout_id/exercises/:id/edit' => 'exercises#edit', as: :edit_workout_exercise

  patch 'workouts/:workout_id/exercises/:id' => 'exercises#update'


  delete 'workouts/:workout_id/exercises/:id' => 'exercises#destroy'




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
