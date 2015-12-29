class AddNotesToExercise < ActiveRecord::Migration
  def change
  	add_column :exercises, :notes, :text
  end
end
