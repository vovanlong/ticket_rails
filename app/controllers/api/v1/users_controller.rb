module Api
  module V1
  	class UsersController < ApplicationController
      skip_before_action :authenticate_request, only: %i[login register]
	  
	  def register
	  	name =  User.find_by_name(params[:name])
	  	@user = User.create(user_params)
	  	if @user.save
	  	  response = {message: 'User created successfully'}
	  	  render json: response , status: "SUCCESS"
	  	elsif name
	  	  render json: {status: "USERNAME_EXISTED"}
	    else
	  	  render json: {status: "VALIDATION_ERROR" ,validations: @user.errors, }
	  	end
	  end

	  def login
        authenticate params[:name], params[:password]
      end

      def max
      
        render json: {
              message: 'You have passed'
         }
   	  end


   	   def authenticate(name, password)
         command = AuthenticateUser.call(name, password)
         if command.success?
           render json: {status: 'success', access_token: command.result,
            			  message: 'Login Successful'}
         else
           render json: { error: command.errors, message: "long" }, status: :unauthorized
         end
       end 	
	  	
	  	private 

	  	  # def user_params
      #       params.require(:user).permit(:name, :email, :password)
    	 #  end
	  
		  def user_params
	        params.permit(
	          :name,
	          :email,
	          :password
	      	  )
	      end
	end
  end
end

