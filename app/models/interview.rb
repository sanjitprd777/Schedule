class Interview < ApplicationRecord
	validates :title, :interviewer_email, :interviewee_email, :start_time, :end_time, presence: true
	validates :avatar, presence: true
	has_attached_file :avatar
	validates_attachment_content_type :avatar, :content_type => "application/pdf"
end
