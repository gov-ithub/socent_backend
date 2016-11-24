module LoginConcern
  extend ActiveSupport::Concern
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def self.create_token(user)
    cfg = Rails.configuration.x.jwt
    exp = Time.now.utc + cfg.duration.seconds
    payload = {
      exp: exp.to_i,
      user_name: user.email
    }
    token = JWT.encode payload, cfg.secret, cfg.algorithm
    AuthorizationToken.new(token: token, exp: exp, user_name: user.email)
  end

  module ClassMethods
    
    def authorization_required(opts={})

      attr_accessor :jwt_token

      before_action opts do
        Rails.logger.debug("before_action: #{request.authorization.inspect}")
        authenticate_or_request_with_http_token do |token, options|
          cfg = Rails.configuration.x.jwt
          self.jwt_token = JWT.decode token, cfg.secret, true, { :leeway => cfg.leeway, :algorithm => cfg.algorithm }
          Rails.logger.debug("token: #{self.jwt_token.inspect}")
        end
      end
    end

  end
end
