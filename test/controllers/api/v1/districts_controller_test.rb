require 'test_helper'

class Api::V1::DistrictsControllerTest < ActionDispatch::IntegrationTest
  include TestLoginConcern
  authorize :one
  
  test "should get index" do
    get api_v1_districts_url
    assert_response :success
  end

  test "should get show" do
    district=districts(:alba)
    get api_v1_district_url(district)
    assert_response :success
  end

end
