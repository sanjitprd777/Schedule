class UserMailer < ApplicationMailer
  default from: 'forrandomloginsspam@gmail.com'
 
  def invitation_email
    @interview = params[:interview]
    mail(to: @interview.interviewee_email, subject: 'Interview Notice.')
  end

  def update_invitation_email
    @interview = params[:interview]
    mail(to: @interview.interviewee_email, subject: 'Interview Update Notice.')
  end

end