class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.integer :attendees_nb
      t.string :venue
      t.integer :activity_id
      t.string :activity_type
      t.datetime :date, index:true
      t.integer :meetup_up

      t.timestamps 
    end

    add_index :events, [:activity_id, :activity_type]
  end
end
