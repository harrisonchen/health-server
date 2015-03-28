module Api
  module V1
    class StepsController < ApplicationController

      def index
        render json: { steps: Step.all.order("id DESC") }
      end

      def show
        step = Step.find_by_id(params[:id])
        if step
          render json: { success: true, step: step }
        else
          render json: { success: false, message: "No step count available" }
        end
      end

      def create
        step = Step.create({
          count: params[:count]
        })
        if step.valid?
          render json: { success: true, step: step }
        else
          render json: { success: false, message: "Failed to create step count" }
        end
      end

      def update

      end

      def destroy
        step = Step.find_by_id(params[:id]).destroy()
        if step
          render json: { success: true, message: "Deleted step count" }
        else
          render json: { success: false, message: "Failed to delete step count" }
        end
      end
    end
  end
end