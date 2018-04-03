class InvitationsController < ApplicationController

   def index
		@invitations = Invitation.all
	end

   def new
		@invitation = Invitation.new
   end

	def show
	end
    
	def create
		all_emails = params[:invitation][:all_emails]
		message = params[:invitation][:message]
		valid = true
		@invalids = []
		all_emails.split(/\s*,\s*/).each do |email|
			valid = false unless(email =~ /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
		end
		if valid
			all_emails.split(/\s*,\s*/).each do |email|
				raw_parameters = {:email => email, :message => message}
 puts raw_parameters
				parameters = ActionController::Parameters.new(raw_parameters)
				@invitation = Invitation.new(parameters.permit(:email, :message))
				@invitation.save
			end
		else
			all_emails.split(/\s*,\s*/).each do |email|
				@invalids.push(email) unless (email =~ /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
			end
			raw_parameters = {:email => all_emails, :message => message}
			parameters = ActionController::Parameters.new(raw_parameters)
			@invitation = Invitation.new(parameters.permit(:email, :message))
		end
		render 'new'
	end	

	private
		def inv_params
			params.require(:invitation).permit(:email,:message)
		end

end
