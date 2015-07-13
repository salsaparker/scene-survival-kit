class AddDateAndTimeColumnsToEvents < ActiveRecord::Migration
  def change
		add_column :events, :start_time, :string
		remove_column :events, :event_start, :datetime
		add_column :events, :event_date, :date
  end
end
