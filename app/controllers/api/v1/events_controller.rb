module Api
  module V1
    class EventsController < ApplicationController
      skip_before_action :authenticate_request
      before_action :set_events, only: [:show]


      def index
        @events = Event.all
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
         render json: {status: "errors"}
       end
      end
      
      def set_token
      end
      

      def get_token
    
        payload
        render json: { status: payload[:user_id] }
      end
        # command = AuthorizeApiRequest.call
        # payload = { data: 'test' }
        # token = JWT.encode payload, "vovanlong1", 'HS256'
        # decoded_token = JWT.decode "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1MzAyNzM4NzR9.EbRCenhAppXJre0lK_PRhYR8BcxMi8SwjijXA2daqhA", nil, false
        # render json: {status:command.result}

 


      private

      def payload
        binding.pry
        auth_header = request.headers['Authorization']
        token = auth_header.split(' ').last
        JsonWebToken.decode(token)
      rescue
        nil
      end
      # attr_reader :headers

      # def http_auth_header
      # binding.pry
      #   if headers['Authorization'].present?
      #     return headers['Authorization'].split(' ').last
      #   else errors.add(:token, 'Missing token')
      #   end
      #   nil
      # end

      # def decoded_auth_token
      # @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
      # end
  
      # def http_auth_header
      #   binding.pry
      #   if headers['Authorization'].present?
      #     return headers['Authorization'].split(' ').last
      #   # else errors.add(:token, 'Missing token')
      #   end
      #   # nil
      # end

       #  def decoded_auth_token
       # #   binding.pry
       #    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
       #  end

       #  def http_auth_header
       #    binding.pry
       #    if headers['Authorization'].present?
       #      return headers['Authorization'].split(' ').last
       #    end
       #  end

        def set_events
           # binding.pry
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
            :picture
            )
          
           # params.require(:events).permit :name, :description, :start_date, :end_date, :picture 
        end

     end
    end
  end
