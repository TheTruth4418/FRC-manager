class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.string :name
      t.integer :team_number
      t.integer :robot_status
      t.string :autonomous
      t.integer :scoring
      t.integer :climbing
      t.integer :event_id
    end
  end
end
