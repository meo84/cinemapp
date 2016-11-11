class AddDirectorsMoviesTable < ActiveRecord::Migration
  def change
  	create_table :directors_movies do |t|
  		t.references :movie
  		t.references :director 

  		t.timestamps
  	end
  end
end
