require 'test_helper'

class Api::V1::EnterprisesControllerTest < ActionDispatch::IntegrationTest
  include TestLoginConcern
  authorize :one

  test "should get show" do
    enterprise = enterprises(:one)
    get api_v1_enterprise_url(enterprise)
    assert_response :success
  end

  test "should get index" do
    get api_v1_enterprises_url
    assert_response :success
  end

  test "should post create" do
    assert_difference 'Enterprise.count' do
      post api_v1_enterprises_url, params: {
        name: 'foo',
        number: 'bar',
        application_date: Date.today}
      assert_response :created
    end
  end

  test "should delete destroy" do
    enterprise = enterprises(:one)
    assert_difference 'Enterprise.count', -1 do
      delete api_v1_enterprise_url(enterprise)
      assert_response :no_content
    end
  end

  test "should patch update" do
    enterprise = enterprises(:one)
    assert_no_difference 'Enterprise.count' do
      patch api_v1_enterprise_url(enterprise),
        params: {name: 'updated'}
      assert_response :success
      enterprise.reload
      assert_equal 'updated', enterprise.name
    end
  end

end
