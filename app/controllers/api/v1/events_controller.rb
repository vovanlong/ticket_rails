module Api
  module V1
    class EventsController < ApplicationController
      before_action :set_events, only: [:show]

      def index
        @events = Event.all
        render json:{ status: "success", data: @events }
      end

      def show
      end

      def create
        @event =  Event.new events_params
        if @event.save
          render json:{ status: "success", data: @event.id }, status: :ok
        end
      end

      private

        def set_events
          @event = Event.find_by id: params[:id]
          if @event.nil?
            render json: {status: 'EVENT_NOT_EXISTED'}, status: :unprocessable_entity
          else
            render json:{ status: "success", data: @event }, status: :ok
          end
        end

        def events_params
          params.require(:event).permit :name, :description, :start_date, :end_date, :picture
        end
    end
  end
end
