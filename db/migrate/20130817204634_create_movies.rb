class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :state
      t.integer :accepted_proposal_id

      t.timestamps
    end
  end
end
