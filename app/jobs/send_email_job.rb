class SendEmailJob < ApplicationJob
  queue_as :default
  # sidekiq_options :queue => :default , :retry => 1

  def perform(*args)
    @interview = Interview.find(interview_params)
    UserMailer.with(interview: @interview).reminder_email.deliver_later(wait_until: @interview.start_time - 30.minutes)    
  end

end
