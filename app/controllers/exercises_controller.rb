class ExercisesController < ApplicationController

	

	def new
		@workout = Workout.find_by_id(params[:workout_id])
		@exercise = Exercise.new
	end

	def create
		@workout = Workout.find_by_id(params[:workout_id])
		@exercise = @workout.exercises.new(exercise_params)

		if @exercise.save
			redirect_to exercises_path(@workout)
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

	def destroy
		@workout = Workout.find_by_id(params[:workout_id])
		@exercise = Exercise.find_by_id(params[:id])

    	@exercise.destroy
    	redirect_to exercises_path
	end

	private
	def exercise_params
      params.require(:exercise).permit(:notes)
    end
	
end
