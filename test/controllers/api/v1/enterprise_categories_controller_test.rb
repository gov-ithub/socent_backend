require 'test_helper'

class Api::V1::EnterpriseCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_enterprise_categories_url
    assert_response :success
  end

  test "should get show" do
    enterprise_category = enterprise_categories(:one)
    get api_v1_enterprise_category_url(enterprise_category)
    assert_response :success
  end

end
