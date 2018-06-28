module Api
  module V1
    class EventsController < ApplicationController
      skip_before_action :authenticate_request, only: %i[login register]
      before_action :set_events, only: [:show]


      def index
        @events = Event.all
        render json:{ status: "success", data: @events }
      end

      def show
      end

      def create
        @event =  Event.new event_params
        if @event.save
          render json:{ status: "success", data: @event.id }, status: :ok

        end
      end
      
      def set_token
          
      end
      

      def get_token
      
        # payload = { data: 'test' }
        # token = JWT.encode payload, "vovanlong1", 'HS256'
        # decoded_token = JWT.decode "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1MzAyNzM4NzR9.EbRCenhAppXJre0lK_PRhYR8BcxMi8SwjijXA2daqhA", nil, false
        render json: {status: decoded_auth_token}

      end


      private

        def decoded_auth_token
          @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
        end

        def http_auth_header

          binding.pry
          if headers['access-token'].present?

            return headers['access-token'].split(' ').last
          end
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
          params.permit(
            :name,
            :description, 
            :start_date, 
            :end_date, 
            :picture,
            )
          # params.require(:event).permit :name, :description, :start_date, :end_date, :picture 
        end


    end
  end
end
