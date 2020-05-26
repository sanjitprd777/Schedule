class Interview < ApplicationRecord
	validates :title, :interviewer_email, :interviewee_email, :start_time, :end_time, presence: true
	validates :avatar, presence: true
	has_attached_file :avatar
	validates_attachment_content_type :avatar, :content_type => "application/pdf"

    # Extra validations
    validate :start_end_time

    def send_invitation_mail(interview_id)
    	@interview = Interview.find(interview_id)
    	UserMailer.with(interview: @interview).invitation_email.deliver_now
    end

    def send_updation_mail(interview_id)
    	@interview = Interview.find(interview_id)
    	UserMailer.with(interview: @interview).update_invitation_email.deliver_now
    end

    def send_decline_mail(interview_id)
    	@interview = Interview.find(interview_id)
		UserMailer.with(interview: @interview).decline_invitation_email.deliver_now
    end

private

    def start_end_time
    	if start_time >= end_time
    		errors.add(:end_time, " must be after start time")
    	end
    end

end