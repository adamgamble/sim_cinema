class CreateMovieStudios < ActiveRecord::Migration
  def change
    create_table :movie_studios do |t|
      t.string :name

      t.timestamps
    end
  end
end
