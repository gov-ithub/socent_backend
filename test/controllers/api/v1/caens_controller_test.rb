require 'test_helper'

class Api::V1::CaensControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_caens_url
    assert_response :success
  end

  test "should get show" do
    caen = caens(:one)
    get api_v1_caen_url(caen)
    assert_response :success
  end

end
