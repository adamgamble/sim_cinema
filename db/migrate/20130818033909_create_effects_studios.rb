class CreateEffectsStudios < ActiveRecord::Migration
  def change
    create_table :effects_studios do |t|
      t.string :name

      t.timestamps
    end
  end
end
