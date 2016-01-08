class ExercisesController < ApplicationController
	before_action :authenticate
	

	def new
		@user = User.find_by_id(params[:user_id])
		@workout = Workout.find_by_id(params[:workout_id])
		@exercise = Exercise.new
	end

	def create
		@user = User.find_by_id(params[:user_id])
		@workout = Workout.find_by_id(params[:workout_id])
		@exercise = @workout.exercises.new(exercise_params)

		#raise @exercise.inspect
		@exercise.save

		redirect_to user_workout_exercises_path(params[:user_id], @workout.id)
    	
	end

	def index
		@user = User.find_by_id(params[:user_id])
		@workout = Workout.find_by_id(params[:workout_id])
		@exercises = @workout.exercises.all
	end

	def show
		@user = User.find_by_id(params[:user_id])
		@workout = Workout.find_by_id(params[:workout_id])
		@exercise = Exercise.find_by_id(params[:id])
	end

	def edit
		@user = User.find_by_id(params[:user_id])
		@workout = Workout.find_by_id(params[:workout_id])
		@exercise = Exercise.find_by_id(params[:id])
	end

	def update
		@workout = Workout.find_by_id(params[:workout_id])
		@exercise = Exercise.find_by_id(params[:id])

		if @exercise.update_attributes(exercise_params)
			redirect_to user_workout_exercises_path
		else
			render :edit
		end
	end

	def destroy
		@workout = Workout.find_by_id(params[:workout_id])
		@exercise = Exercise.find_by_id(params[:id])

    	@exercise.destroy
    	redirect_to user_workout_exercises_path
	end

	private
	def exercise_params
      params.require(:exercise).permit(:notes, :title, :video)
    end
	
end
