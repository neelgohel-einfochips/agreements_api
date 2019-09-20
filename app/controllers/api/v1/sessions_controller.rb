module Api
  module V1
    class SessionsController < Api::ApiController
      before_action :authenticate_user!, only: :logout
      def login
        user = User.find_by(email: params[:email])
        return json_response(401, 'User with given E-Mail ID not found') if user.blank?
        if user.valid_password?(params[:password])
          user.login!
          json_response(200, 'Signed In Successfully!', { authentication_token: user.authentication_token })
        else
          json_response(401, 'Invalid Password')
        end
      end
    
      def logout
        if current_user&.logout!
          json_response(200, 'Signed Out Successfully!', {})
        else
          json_response(500, 'Opps, Something went wrong!')
        end
      end
    end
  end  
end

