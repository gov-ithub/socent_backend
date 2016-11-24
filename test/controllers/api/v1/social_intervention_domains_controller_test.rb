require 'test_helper'

class Api::V1::SocialInterventionDomainsControllerTest < ActionDispatch::IntegrationTest
  include TestLoginConcern
  authorize :one
  
  test "should get show" do
    sid = social_intervention_domains(:media)
    get api_v1_social_intervention_domain_url(sid)
    assert_response :success
  end

  test "should get index" do
    get api_v1_social_intervention_domains_url
    assert_response :success
  end

end
