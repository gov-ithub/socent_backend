require 'test_helper'

class Api::V1::VulnerableGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_vulnerable_groups_url
    assert_response :success
  end

  test "should get show" do
    vulnerable_group = vulnerable_groups(:poor)
    get api_v1_vulnerable_group_url(vulnerable_group)
    assert_response :success
  end

end
