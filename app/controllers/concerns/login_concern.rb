module LoginConcern
  extend ActiveSupport::Concern

  def create_token(user)
    cfg = Rails.configuration.x.jwt
    exp = Time.now.utc + cfg.duration.seconds
    payload = {
      exp: exp.to_i,
      user_name: user.email
    }
    token = JWT.encode payload, cfg.secret, cfg.algorithm
    AuthorizationToken.new(token: token, exp: exp, user_name: user.email)
  end

end
