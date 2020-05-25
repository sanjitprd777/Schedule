class SendEmailJob < ActiveJob::Base
  queue_as :default
  # sidekiq_options :queue => :default , :retry => 1
   
  def perform(interview_id)
    @interview = Interview.find(interview_id)
    UserMailer.with(interview: @interview).reminder_email.deliver_later
	# UserMailer.with(interview: @interview).invitation_email.deliver_now
	# UserMailer.with(interview: @interview).reminder_email.deliver_later(wait_until: @interview.start_time - 30.minutes)
 #    UserMailer.with(interview: @interview).reminder_email.deliver_later(wait_until: 1.minutes.from_now)        
  end

end
