class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(*args)
  	UserMailer.with(interview: @interview).invitation_email.deliver_now
	UserMailer.with(interview: @interview).interviewer_invitation_email.deliver_now		
  end


  def perform_update(*args)
  	UserMailer.with(interview: @interview).update_invitation_email.deliver_now
	UserMailer.with(interview: @interview).interviewer_update_invitation_email.deliver_now
  end

end
