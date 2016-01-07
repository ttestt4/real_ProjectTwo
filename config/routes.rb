Rails.application.routes.draw do

  root 'workouts#login'


  #SESSIONS
   get 'login' => 'sessions#new', as: :login_form
   post 'login' => 'sessions#create'
   delete 'logout' => 'sessions#destroy', as: :sessions

  ##USERS
  get '/users/new' => 'users#new', as: :new_user
  get '/users' => 'users#index', as: :users
  post '/users' => 'users#create'

  
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

end
