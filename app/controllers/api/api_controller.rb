class Api::ApiController < ActionController::API
	respond_to :json
	attr_accessor :current_user

	def authenticate_user!
		token = request.headers[:HTTP_ACCESS_TOKEN]
		return json_response(401, 'Missing Authentication Token') if token.blank?
		user = User.find_by(authentication_token: token)
		return json_response(401, 'Invalid Authentication Token') if user.blank?
		@current_user = user
	end

	def json_response(status, message, data = {})
    render status: status, json: { message: message, data: data }
  end
end