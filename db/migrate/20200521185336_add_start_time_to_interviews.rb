class AddStartTimeToInterviews < ActiveRecord::Migration[5.1]
  def change
    add_column :interviews, :start_time, :datetime
  end
end
