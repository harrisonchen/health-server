module Api
	module V1
		class MonitorController < ApplicationController
			def status
				temperatureIds = Temperature.all.order('id DESC').limit(5).pluck(:id)
				averageTemperature = Temperature.where(id: temperatureIds).average(:fahrenheit).to_i
				heartBeatIds = Heartbeat.all.order('id DESC').limit(5).pluck(:id)
				averageHeartBeat = Heartbeat.where(id: heartBeatIds).average(:beats_per_minute).to_i

				if averageHeartBeat == 0
					if Health.first.status != "no pulse"
						health = Health.first
						health.status = "no pulse"
						health.save
						body = "!!!EMERGENCY!!! You friend Justin Khoo has no pulse right now. You may want to contact Emergency Help."

						client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
		  			# message = client.messages.create from: '+16502156958', to: "+16509229438", body: params["body"]
		  			# message = client.messages.create from: '+16502156958', to: "+16262523053", body: params["body"]
		  			message = client.messages.create from: '+16502156958', to: "+16509229438", body: body
						message = client.messages.create from: '+16502156958', to: "+16262523053", body: body
		  		end
					render json: {
						average_temperature: averageTemperature,
						average_heartbeat: averageHeartBeat,
						message: "You are dead"
					}
				elsif averageHeartBeat < 10
					if Health.first.status != "low heartrate"
						body = "Your friend Justin Khoo may be getting a heartattack right now. You may want to contact help."

						client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
		  			# message = client.messages.create from: '+16502156958', to: "+16509229438", body: params["body"]
		  			# message = client.messages.create from: '+16502156958', to: "+16262523053", body: params["body"]
		  			message = client.messages.create from: '+16502156958', to: "+16509229438", body: body
						message = client.messages.create from: '+16502156958', to: "+16262523053", body: body
	  				health = Health.first
	  				health.status = "low heartrate"
						health.save
		  		end
					render json: {
						average_temperature: averageTemperature,
						average_heartbeat: averageHeartBeat,
						message: "You better be in the ER right now"
					}
				elsif averageHeartBeat < 30
					if Health.first.status != "low heartrate"
						body = "Your friend Justin Khoo may be getting a heartattack right now. You may want to contact help."

						client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
		  			# message = client.messages.create from: '+16502156958', to: "+16509229438", body: params["body"]
		  			# message = client.messages.create from: '+16502156958', to: "+16262523053", body: params["body"]
		  			message = client.messages.create from: '+16502156958', to: "+16509229438", body: body
						message = client.messages.create from: '+16502156958', to: "+16262523053", body: body
	  				health = Health.first
	  				health.status = "low heartrate"
						health.save
		  		end
					render json: {
						average_temperature: averageTemperature,
						average_heartbeat: averageHeartBeat,
						message: "Contacting your emergency contacts right now"
					}
				elsif averageHeartBeat < 40
					if Health.first.status != "low heartrate"
						body = "Your friend Justin Khoo may be getting a heartattack right now. You may want to contact help."

						client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
		  			# message = client.messages.create from: '+16502156958', to: "+16509229438", body: params["body"]
						# message = client.messages.create from: '+16502156958', to: "+16262523053", body: params["body"]
  					message = client.messages.create from: '+16502156958', to: "+16509229438", body: body
						message = client.messages.create from: '+16502156958', to: "+16262523053", body: body
						health = Health.first
	  				health.status = "low heartrate"
						health.save
		  		end
					render json: {
						average_temperature: averageTemperature,
						average_heartbeat: averageHeartBeat,
						message: "You may be getting a heart attack right now"
					}
				elsif averageTemperature >= 90 && averageHeartBeat <= 100
					health = Health.first
  				health.status = "high heartrate"
					health.save
					render json: {
						average_temperature: averageTemperature,
						average_heartbeat: averageHeartBeat,
						message: "You are potentially sick"
					}
				elsif averageTemperature >= 90 && averageHeartBeat > 100
					health = Health.first
  				health.status = "high heartrate"
					health.save
					render json: {
						average_temperature: averageTemperature,
						average_heartbeat: averageHeartBeat,
						message: "You are either really sick or exercising"
					}
				elsif averageTemperature < 90 && averageHeartBeat > 100
					health = Health.first
  				health.status = "high heartrate"
					health.save
					render json: {
						average_temperature: averageTemperature,
						average_heartbeat: averageHeartBeat,
						message: "You are either really excited or having an anxiety attack"
					}
				else
					if Health.first.status == "no pulse" || Health.first.status == "low heartrate"
						body = "Your friend Justin Khoo's pulse is back to normal"

						client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
		  			# message = client.messages.create from: '+16502156958', to: "+16509229438", body: params["body"]
		  			# message = client.messages.create from: '+16502156958', to: "+16262523053", body: params["body"]
		  			message = client.messages.create from: '+16502156958', to: "+16509229438", body: body
						message = client.messages.create from: '+16502156958', to: "+16262523053", body: body
					end
					health = Health.first
  				health.status = "good heartrate"
					health.save

					render json: {
						average_temperature: averageTemperature,
						average_heartbeat: averageHeartBeat,
						message: "You are in good condition"
					}
				end
			end
		end
	end
end
