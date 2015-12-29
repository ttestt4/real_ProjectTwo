class WorkoutsController < ApplicationController

	def login

	end


	def new
		@workout = Workout.new
	end

	def create
		  @workout = Workout.new(workout_params)

    if @workout.save
      redirect_to workout_path(@workout)
    else
      render :new
    end
	end

	
	def index
		@workouts = Workout.all.order('date DESC')
	end

	def show
		@workout = Workout.find_by_id(params[:id])
		
	end


	def edit
		@workout = Workout.find_by_id(params[:id])
	end

	def update
		@workout = Workout.find_by_id(params[:id])
		if @workout.update_attributes(workout_params)
			redirect_to workout_path(@workout)
		else
			render :edit
		end
	end

	def destroy
		@workout = Workout.find_by_id(params[:id])
		@workout.destroy
		redirect_to index_path
	end

end

private
	def workout_params
		params.require(:workout).permit(:description, :date)
	end

	def set_workout
		@workout = Workout.find(params[:id])
	end
