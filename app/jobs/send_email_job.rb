class SendEmailJob < ActiveJob::Base
  queue_as :mailers
   
  def perform(interview_id)
    @interview = Interview.find(interview_id)
	UserMailer.with(interview: @interview).reminder_email.deliver_later(wait_until: @interview.start_time - 30.minute)
  end

end
