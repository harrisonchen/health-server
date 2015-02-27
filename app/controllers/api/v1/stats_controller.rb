module Api
	module V1
		class StatsController < ApplicationController
 
		  skip_before_action :verify_authenticity_token

		  respond_to :json

		  def daily_temperatures
		  	daily_temperatures = TemperatureAggregateDay.all.order("id DESC")
		  	render json: {
		  		daily_temperatures: daily_temperatures
		  	}
		  end
		 
		end
	end
end