class CreateScouts < ActiveRecord::Migration[6.1]
  def change
    create_table :scouts do |t|
      t.integer :participant_id
      t.string :robot
      t.string :autonomus
      t.string :scoring
      t.string :climbing

      t.timestamps
    end
  end
end
