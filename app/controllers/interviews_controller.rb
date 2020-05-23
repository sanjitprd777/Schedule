class InterviewsController < ApplicationController

	def index
		@interviews = Interview.all
	end

	def show
		@interview = Interview.find(params[:id])
	end

	def new
		@interview = Interview.new
	end

	def edit
	  	@interview = Interview.find(params[:id])
	end

	def create
		@interview = Interview.new(interview_params) 
		if @interview.save
			# SendEmailJob.perform_later
			UserMailer.with(interview: @interview).invitation_email.deliver_now
			UserMailer.with(interview: @interview).interviewer_invitation_email.deliver_now
			redirect_to @interview
		else
			render 'new'
		end
	end

	def update
		@interview = Interview.find(params[:id]) 
		if @interview.update(interview_params) # can restrict in passing args
			# SendEmailJob.perform_update_later
			UserMailer.with(interview: @interview).update_invitation_email.deliver_now
			UserMailer.with(interview: @interview).interviewer_update_invitation_email.deliver_now
			redirect_to @interview
		else
			render 'edit'
		end
	end

	def destroy
	  @interview = Interview.find(params[:id])
	  @interview.destroy
	 
	  redirect_to interviews_path
	end

private

	def interview_params
		params.require(:interview).permit(:title, :interviewer_email, :interviewee_email, :start_time, :end_time, :avatar)
	end

end
