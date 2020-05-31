class AddAttachmentAvatarToInterviews < ActiveRecord::Migration[5.1]
  def self.up
    change_table :interviews do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :interviews, :avatar
  end
end
