require 'test_helper'

class Api::V1::EntrepreneursControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_v1_entrepreneurs_show_url
    assert_response :success
  end

  test "should get index" do
    get api_v1_entrepreneurs_index_url
    assert_response :success
  end

end
