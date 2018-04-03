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
		@invitation = Invitation.new(inv_params)
		if @invitation.save
    		redirect_to @invitation
  		else
    		render 'new'
  		end
	end	

	private
		def inv_params
			params.require(:invitation).permit(:email,:message)
		end

end
