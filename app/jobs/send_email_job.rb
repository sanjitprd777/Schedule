class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @interview = Interview.find(interview_id)
  end


end
