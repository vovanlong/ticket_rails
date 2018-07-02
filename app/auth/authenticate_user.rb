# app/auth/authenticate_user.rb
class AuthenticateUser
    prepend SimpleCommand
    attr_accessor :name, :password
  
    #this is where parameters are taken when the command is called
    def initialize(name, password)
      @name = name
      @password = password
    end
    
    #this is where the result gets returned
    def call
       # binding.pry
      JsonWebToken.encode(user_id: user.id) if user
    end
  
    private
  
    def user
      # binding.pry
      user = User.find_by_name(name)
      return    user if user && user.authenticate(password)
  
      errors.add :user_authentication, 'Invalid credentials'
      nil
    end
end
