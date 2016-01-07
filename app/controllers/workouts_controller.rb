class WorkoutsController < ApplicationController
	before_action :authenticate

	def login

	end


	def new
		@workout = Workout.new
		@user = User.find_by_id(params[:user_id])
	end

	def create
		  @workout = Workout.new(workout_params)

    if @workout.save
      redirect_to user_workout_path(params[:user_id], @workout)
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
		@user = User.find_by_id(params[:user_id])
		@workout = Workout.find_by_id(params[:id])
	end

	def update
		@workout = Workout.find_by_id(params[:id])

		
		if @workout.update_attributes(workout_params)
			redirect_to user_workout_path(params[:user_id], @workout.id)
		else
			render :edit
		end
	end

	def destroy
		@workout = Workout.find_by_id(params[:id])
		@workout.destroy
		redirect_to user_workouts_path
	end

	def forsearch
		@workout = Workout.all.order('date DESC')
		@exercise = Exercise.all
		@user = User.find_by_id(params[:user_id])

		@exercisedesired = #getinput from users here

		@return = Exercise.all.where(title: "#{@exercisedesired}")
	end

end

private
	def workout_params
		params.require(:workout).permit(:description, :date)
	end

	def set_workout
		@workout = Workout.find(params[:id])
	end
