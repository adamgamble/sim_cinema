class CreateMovieRoles < ActiveRecord::Migration
  def change
    create_table :movie_roles do |t|
      t.integer :movie_id
      t.integer :actor_id

      t.timestamps
    end
  end
end
