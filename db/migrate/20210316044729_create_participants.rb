class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.string :name
      t.integer :team_number
      t.integer :event_id
      t.integer :scout_id

      t.timestamps
    end
  end
end
