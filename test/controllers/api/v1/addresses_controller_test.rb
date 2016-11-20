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

  test "should patch update" do
    address = addresses(:one)
    assert_no_difference 'Address.count' do
      patch api_v1_address_url(address), params: { city: 'updated' }
      assert_response :success
      address.reload
      assert_equal 'updated', address.city
    end
  end

  test "should delete destroy" do
    address = addresses(:one)
    assert_difference 'Address.count', -1 do
      delete api_v1_address_url(address)
      assert_response :no_content
    end
  end

end
