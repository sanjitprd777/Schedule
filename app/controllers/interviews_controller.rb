class InterviewsController < ApplicationController
    skip_before_action :verify_authenticity_token
	include Pundit

	def index
		@interviews = Interview.all.order(created_at: :desc)
		render json: @interviews
	end

	def show
		@interview = Interview.find(params[:id]) 
		render json: @interview
	end

	def new
		@interview = Interview.new
		# render json: @interview
	end

	def edit
	  	@interview = Interview.find(params[:id])
	  	render json: @interview
	end

	def create
		puts "Inside create method 1"
		start_time = params[:interview][:start_time]
		end_time = params[:interview][:end_time]
		interviewee_email = params[:interview][:interviewee_email]
		interviewer_email = params[:interview][:interviewer_email]
		result, reason = participants_available(start_time, end_time, interviewee_email, interviewer_email)
		puts interview_params
		@interview = Interview.new(interview_params2) 
		if result == true
			puts "Inside create method 2"
			respond_to do |format|
				puts "Inside create method 3"
				# x = @interview.save!
				# puts x
				if @interview.save
					puts "Inside create method 4"
					SendEmailJob.perform_later(@interview.id) # Scheduling tasks using '../app/jobs/send_email_job.rb'
					@interview.send_invitation_mail(@interview.id)
					format.html { redirect_to @interviews} ## Specify the format in which you are rendering "new" page
					format.json { render 'show', status: :created, location: @interview } 
				else
					puts "Inside create else 5"
					format.html { render 'new'} ## Specify the format in which you are rendering "new" page
     				format.json { render json: @interview.errors } ## You might want to specify a json format as well
				end
			end
			# render json: @interview
		else
			respond_to do |format|
	            format.html { render 'new', notice: reason}
	        end
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
			respond_to do |format|
				if @interview.update(interview_params) # can restrict in passing args
					SendEmailJob.perform_later(@interview.id)
					@interview.send_updation_mail(@interview.id)
					format.json { @interview } 
				else
					format.html { render :edit, notice: "Unable to complete interview request, Please check parameters" }
				end
			end
		else
			respond_to do |format|
	            format.html { render 'new', notice: reason}
	        end
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

	def interview_params2
		params.require(:interview).permit(:title, :interviewer_email, :interviewee_email, :start_time, :end_time)
		
	end

	def participants_available(start_time, end_time, interviewee_email, interviewer_email)
		return true  # must remove this line
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
