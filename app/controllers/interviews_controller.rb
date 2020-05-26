class InterviewsController < ApplicationController
	include Pundit
	
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
		start_time = params[:interview][:start_time]
		end_time = params[:interview][:end_time]
		interviewee_email = params[:interview][:interviewee_email]
		interviewer_email = params[:interview][:interviewer_email]
		result, reason = participants_available(start_time, end_time, interviewee_email, interviewer_email)

		@interview = Interview.new(interview_params) 
		if result == true
			if @interview.save
				SendEmailJob.perform_later(@interview.id) # Scheduling tasks using '../app/jobs/send_email_job.rb'
				@interview.send_invitation_mail(@interview.id)
				flash[:success] = "Interview has been created!"
	            redirect_to @interview
			else
				flash[:alert] = "Unable to complete interview request, Please check parameters"
				render 'new'
			end
		else
			respond_to do |format|
	            format.html { render 'new', notice: reason}
	        end
    		# @interview.errors.add(message: reason) 
    		# render 'new'
    	end
	end

	def update
		start_time = params[:interview][:start_time]
		end_time = params[:interview][:end_time]
		interviewee_email = params[:interview][:interviewee_email]
		interviewer_email = params[:interview][:interviewer_email]
		result, reason = participants_available(start_time, end_time, interviewee_email, interviewer_email)

		@interview = Interview.find(params[:id])
		if result == true
			if @interview.update(interview_params) # can restrict in passing args
				SendEmailJob.perform_later(@interview.id)
				@interview.send_updation_mail(@interview.id)
				flash[:success] = "Interview has been updated!"
	            redirect_to @interview
			else
				flash[:alert] = "Unable to complete interview request, Please check parameters"
				render 'edit'
			end
		else
			respond_to do |format|
	            format.html { render 'new', notice: reason}
	        end
    		# @interview.errors.add(message: reason) 
    		# render 'new'
    	end
	end

	def destroy
		@interview = Interview.find(params[:id])
		if @interview.errors.any?
			return
		end
		# @interview.send_decline_mail(@interview.id)
		@interview.destroy
		flash[:success] = "Interview has been declined!"
		redirect_to interviews_path
	end

private

	def interview_params
		params.require(:interview).permit(:title, :interviewer_email, :interviewee_email, :start_time, :end_time, :avatar)
	end


	def participants_available(start_time, end_time, interviewee_email, interviewer_email)
		sd = start_time.to_date.strftime("%Y%m%d").to_i
		st = start_time.to_time
		ed = end_time.to_date.strftime("%Y%m%d").to_i
		et = end_time.to_time
		time_clash = Interview.where("(end_time BETWEEN ? AND ?) or (start_time BETWEEN ? AND ?) or ((end_time > ?) and (start_time < ?))", st, et, st, et, et, st)
		
		if time_clash.where("interviewer_email = ?", interviewer_email).exists?
			puts "Interviewer #{interviewer_email} is not available."
			return false, "Interviewer #{interviewer_email} is not available."
		end
		if time_clash.where("interviewee_email = ?", interviewee_email).exists?
			return false, "Interviewer #{interviewee_email} is not available."
		end
		
		return true
	end

end
