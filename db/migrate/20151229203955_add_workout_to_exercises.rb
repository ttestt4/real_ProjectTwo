class AddWorkoutToExercises < ActiveRecord::Migration
  def change
    add_reference :exercises, :workout, index: true, foreign_key: true
    add_column :exercises, :workout_id, :integer
    add_index :exercises, :workout_id
  end
end
