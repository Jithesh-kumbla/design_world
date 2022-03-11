module JwtAuthWrapper
  extend ActiveSupport::Concern

	self.included do 
		#do any before action
		before_action :require_login
	end

	private
	
	def token(user_id)
		payload = {user_id: user_id, exp: 30.minutes}
		JWT.encode(payload, hmac_secret, 'HS256')
	end

	def hmac_secret
		'123123abcabc123123'
	end

	def client_has_valid_token?
		!!current_user_id
	end

	def current_user_id
		begin
			token = request.headers['Authorization']
			decoded_array = JWT.decode(token, hmac_secret, true, {algorithm: 'HS256'})
			payload = decoded_array.first
		rescue 
			return nil
		end
		payload['user_id']
	end

	def require_login
		render json: {error: 'Unauthorized'}, status: :unauthorized unless client_has_valid_token?
	end
end