require 'test_helper'

class Api::V1::AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    address = addresses(:one)
    get api_v1_address_url(address)
    assert_response :success
  end
end
