require 'test_helper'

class Api::V1::AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    address = addresses(:one)
    get api_v1_address_url(address)
    assert_response :success
  end

  test "should post create" do
    assert_difference 'Address.count' do
      post api_v1_addresses_url, params: { city: 'Bucharest' }
      assert_response :created
    end
  end
end
