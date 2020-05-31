class AddEndTimeToInterviews < ActiveRecord::Migration[5.1]
  def change
    add_column :interviews, :end_time, :datetime
  end
end
