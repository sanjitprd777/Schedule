class SendEmailToUserWorkerWorker
  include Sidekiq::Worker
  
  # sidekiq_options retry: 5 
  # sidekiq_options queue: 'mailers'

  def perform(interviewee_email)
  	
  	puts "Hello, #{interviewee_email}"
  	# @interview = Interview.find(interview_id)
  	# UserMailer.invitationn_email(interviewee_email).deliver
	  # UserMailer.with(interview: @interview).invitation_email.deliver_now

  end
end
