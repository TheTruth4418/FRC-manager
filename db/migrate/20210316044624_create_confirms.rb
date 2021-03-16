class CreateConfirms < ActiveRecord::Migration[6.1]
  def change
    create_table :confirms do |t|
      t.integer :grades
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
