require 'test_helper'

class Api::V1::LoginControllerTest < ActionDispatch::IntegrationTest
  include TestLoginConcern
  authorize :one
  

  test "should post return valid user token" do
    user = users(:one)
    post api_v1_login_path, params: {user: {email: user.email, password: 'one'}}
    assert_response :created
  end

  test "should post reject valid user wrong password" do
    user = users(:one)
    post api_v1_login_path, params: {user: {email: user.email, password: 'two'}}
    assert_response :unauthorized
  end

  test "should post reject invalid user" do
    post api_v1_login_path, params: {user: {email: 'nexistent@example.com', password: 'foo'}}
    assert_response :unauthorized
  end
end

