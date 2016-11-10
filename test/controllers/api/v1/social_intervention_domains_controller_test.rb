require 'test_helper'

class Api::V1::SocialInterventionDomainsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_v1_social_intervention_domains_show_url
    assert_response :success
  end

  test "should get index" do
    get api_v1_social_intervention_domains_index_url
    assert_response :success
  end

end
