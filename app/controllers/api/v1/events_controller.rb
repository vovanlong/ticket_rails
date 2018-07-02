module Api
  module V1
    class EventsController < ApplicationController
      before_action :set_events, only: [:show]
      # after_action only: [:index] { set_pagination_headers :events }

      def index
        @events = Event.page(page).per(per_page)
        #set_pagination_headers
        render json:{ status: "success", data: @events }
      end

      def show
      end

      def create
       @event =  Event.new(event_params)
       @event.user_id = payload[:user_id]
       if @event.save!
         render json:{ status: payload[:user_id], data: @event.id }, status: :ok
       else
         render json: {status: @event.errors}, status: :unprocessable_entity
       end
      end

      def update
        binding.pry
        @event = Event.find_by id: params[:id]
        if @event.update(event_params)
          render json: { status: "success" }
        else
          render json: {status: @event.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        @event = Event.find_by id: params[:id]
        @event.destroy
        render json: {status: 'SUCCESS', message: 'Deleted  events', data:@event}, status: :ok
      end

      private


        def payload
          # binding.pry
          auth_header = request.headers['Authorization']
          token = auth_header.split(' ').last
          JsonWebToken.decode(token)
        rescue
          nil
        end

        def set_events
          @event = Event.find_by id: params[:id]
          if @event.nil?
            render json: {status: 'EVENT_NOT_EXISTED'}, status: :unprocessable_entity
          else
            render json:{ status: "success", data: @event }, status: :ok
          end
        end

        def event_params
          binding.pry
          params.permit(:name, :description, :start_date, :end_date, :picture)
        end

        def page
          @page ||= params[:page] || 1
        end

        def per_page
          @per_page ||= params[:per_page] || 10
        end
     end
  end
end
