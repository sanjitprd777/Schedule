class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.string :title
      t.string :interviewer_email
      t.string :interviewee_email

      t.timestamps
    end
  end
end
