require 'test_helper'

class Api::V1::EnterprisesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_v1_enterprises_show_url
    assert_response :success
  end

  test "should get index" do
    get api_v1_enterprises_index_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_enterprises_create_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_enterprises_destroy_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_enterprises_update_url
    assert_response :success
  end

end
