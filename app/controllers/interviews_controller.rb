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
			SendEmailToUserWorkerWorker.perform_at(1.minutes.from_now, @interview.interviewee_email)
			# SendEmailJob.perform_later(@interview.id)
			# SendEmailJob.set(wait_until: 1.minutes.from_now).perform_later(@interview.id)			
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
			# UserMailer.with(interview: @interview).update_invitation_email.deliver_now
   #          UserMailer.with(interview: @interview).reminder_email.deliver_later(wait_until: @interview.start_time - 30.minutes)
			flash[:success] = "Interview has been updated!"
            redirect_to @interview
		else
			flash[:alert] = "Unable to complete interview request, Please check parameters"
			render 'edit'
		end
	end

	def destroy
		@interview = Interview.find(params[:id])
		# UserMailer.with(interview: @interview).decline_invitation_email.deliver_now
		@interview.destroy
		flash[:success] = "Interview has been declined!"
		redirect_to interviews_path
	end

private

	def interview_params
		params.require(:interview).permit(:title, :interviewer_email, :interviewee_email, :start_time, :end_time, :avatar)
	end

end
