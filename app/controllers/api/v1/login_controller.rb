class Api::V1::LoginController < ApplicationController
  include LoginConcern
  respond_to :json

  # POST /api/v1/login
  def create
    lp = login_params
    user = User.where(email: lp[:email]).first
    if user.nil? or !user.is_password_match?(lp[:password])
      head :unauthorized
    else
      @token = create_token(user)
      respond_with @token, location: nil, status: :created
    end
  end

  private

  def login_params
    params.require(:user).permit :email, :password
  end
end

