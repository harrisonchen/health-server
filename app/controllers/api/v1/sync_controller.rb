module Api
  module V1
    class SyncController < ApplicationController
 
      skip_before_action :verify_authenticity_token

      respond_to :json

      def sync
        if params["tp"]
          temperatures = params["tp"].split(":")
          for temperature in temperatures
            Temperature.create(fahrenheit: temperature)
          end
        end

        if params["hb"]
          heartbeats = params["hb"].split(":")
          for heartbeat in heartbeats
            Heartbeat.create(beats_per_minute: heartbeat)
          end
        end

        if params["sp"]
          steps = params["sp"].split(":")
          for count in steps
            Step.create(count: count)
          end
        end

        render json: {
          temperatures: temperatures,
          heartbeats: heartbeats,
          steps: steps
        }
      end
     
    end
  end
end