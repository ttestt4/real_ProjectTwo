class AddTitleToExercise < ActiveRecord::Migration
  def change
  	add_column :exercises, :title, :text
  end
end
