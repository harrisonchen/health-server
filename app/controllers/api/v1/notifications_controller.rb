module Api
	module V1
		class NotificationsController < ApplicationController
 
		  skip_before_action :verify_authenticity_token

		  respond_to :json
		 
		  def notify
		  	client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
		  	message = client.messages.create from: '+16502156958', to: "+16509229438", body: params["body"]
		  	message = client.messages.create from: '+16502156958', to: "+16262523053", body: params["body"]
		  	# message = client.messages.create from: '+16502156958', to: "+1#{params["number"]}", body: params["body"]

		  	render json: { message: message.status }
		  end
		 
		end
	end
end