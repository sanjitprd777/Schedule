class UserMailer < ApplicationMailer
  default from: 'forrandomloginsspam@gmail.com'
 
  def invitation_email
    @interview = params[:interview]
    @url = 'http://localhost:3000/' + @interview.avatar.url
    mail(to: @interview.interviewee_email, subject: 'Upcoming Interview Notice.')
  end

  def interviewer_invitation_email
    @interview = params[:interview]
    @url = 'http://localhost:3000/' + @interview.avatar.url
    mail(to: @interview.interviewer_email, subject: 'Upcoming Interview Notice.')
  end

  def update_invitation_email
    @interview = params[:interview]
    @url = 'http://localhost:3000/' + @interview.avatar.url
    mail(to: @interview.interviewee_email, subject: 'Interview Update Notice.')
  end

  def interviewer_update_invitation_email
    @interview = params[:interview]
    @url = 'http://localhost:3000/' + @interview.avatar.url
    mail(to: @interview.interviewer_email, subject: 'Interview Update Notice.')
  end

  def decline_invitation_email
    @interview = params[:interview]
    @url = 'http://localhost:3000/' + @interview.avatar.url
    mail(to: @interview.interviewee_email, subject: 'Interview Declined Notice.')
  end

  def interviewer_decline_invitation_email
    @interview = params[:interview]
    @url = 'http://localhost:3000/' + @interview.avatar.url
    mail(to: @interview.interviewer_email, subject: 'Interview Declined Notice.')
  end

  def reminder_email
    @interview = params[:interview]
    @url = 'http://localhost:3000/' + @interview.avatar.url
    mail(to: @interview.interviewee_email, subject: 'Reminder for Upcomming Interview.')
  end  

end