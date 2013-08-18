class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.integer :movie_studio_id
      t.integer :movie_id
      t.decimal :amount

      t.timestamps
    end
  end
end
