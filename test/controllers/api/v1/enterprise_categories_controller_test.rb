require 'test_helper'

class Api::V1::EnterpriseCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_enterprise_categories_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_enterprise_categories_show_url
    assert_response :success
  end

end
