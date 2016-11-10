require 'test_helper'

class Api::V1::SocialInterventionDomainCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_v1_social_intervention_domain_categories_show_url
    assert_response :success
  end

  test "should get index" do
    get api_v1_social_intervention_domain_categories_index_url
    assert_response :success
  end

end
