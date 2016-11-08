class RenameColumnInEvents < ActiveRecord::Migration
  def change
  	rename_column :events, :meetup_up, :meetup_id
  end
end
