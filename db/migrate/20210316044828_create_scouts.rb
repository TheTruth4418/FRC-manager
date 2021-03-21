class CreateScouts < ActiveRecord::Migration[6.1]
  def change
    create_table :scouts do |t|
      t.integer :participant_id
      t.integer :robot
      t.integer :autonomus
      t.integer :scoring
      t.integer :climbing

      t.timestamps
    end
  end
end
