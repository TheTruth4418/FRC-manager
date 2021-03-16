class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.string :location
      t.integer :team_id
      t.integer :confirm_id

      t.timestamps
    end
  end
end
