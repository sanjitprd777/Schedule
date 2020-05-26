class InterviewsController < ApplicationController

	def index
		@interviews = Interview.all.order(created_at: :desc)
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
			SendEmailJob.perform_later(@interview.id) # Scheduling tasks using '../app/jobs/send_email_job.rb'
			@interview.send_invitation_mail(@interview.id)
			flash[:success] = "Interview has been created!"
            redirect_to @interview
		else
			flash[:alert] = "Unable to complete interview request, Please check parameters"
			render 'new'
		end
	end

	def update
		@interview = Interview.find(params[:id]) 
		if @interview.update(interview_params) # can restrict in passing args
			SendEmailJob.perform_later(@interview.id)
			@interview.send_updation_mail(@interview.id)
			flash[:success] = "Interview has been updated!"
            redirect_to @interview
		else
			flash[:alert] = "Unable to complete interview request, Please check parameters"
			render 'edit'
		end
	end

	def destroy
		@interview = Interview.find(params[:id])
		@interview.send_decline_mail(@interview.id)
		@interview.destroy
		flash[:success] = "Interview has been declined!"
		redirect_to interviews_path
	end

private

	def interview_params
		params.require(:interview).permit(:title, :interviewer_email, :interviewee_email, :start_time, :end_time, :avatar)
	end

end
