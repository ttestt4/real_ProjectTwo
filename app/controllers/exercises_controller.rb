class ExercisesController < ApplicationController

	

	def new
		@user = User.find_by_id(params[:user_id])
		@workout = Workout.find_by_id(params[:workout_id])
		@exercise = Exercise.new
	end

	def create
		@workout = Workout.find_by_id(params[:workout_id])
		@exercise = @workout.exercises.new(exercise_params)

		if @exercise.save
			redirect_to user_workout_exercises_path(params[:user_id], @workout.id)
    	else
      		render :new
   		end
	end

	def index
		@workout = Workout.find_by_id(params[:workout_id])
		@exercises = @workout.exercises.all
	end

	def show
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
      params.require(:exercise).permit(:notes, :title)
    end
	
end
