require 'test_helper'

class Api::V1::EntrepreneursControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    entrepreneur = entrepreneurs(:one)
    get api_v1_entrepreneur_url(entrepreneur)
    assert_response :success
  end

  test "should get index" do
    get api_v1_entrepreneurs_url
    assert_response :success
  end

  test "should post create" do
    assert_difference 'Entrepreneur.count' do
      post api_v1_entrepreneurs_url, params: { name: 'foo' }
      assert_response :created
    end
  end

  test "should patch update" do
    entrepreneur = entrepreneurs(:one)
    assert_no_difference 'Entrepreneur.count' do
      patch api_v1_entrepreneur_url(entrepreneur), params: { name: 'updated' }
      assert_response :success
      entrepreneur.reload
      assert_equal 'updated', entrepreneur.name
    end
  end

  test "should delete destroy" do
    entrepreneur = entrepreneurs(:one)
    assert_difference 'Entrepreneur.count', -1 do
      delete api_v1_entrepreneur_url(entrepreneur)
      assert_response :no_content
    end
  end

end
