class Interview < ApplicationRecord
	validates :title, :interviewer_email, :interviewee_email, :start_time, :end_time, presence: true
end
