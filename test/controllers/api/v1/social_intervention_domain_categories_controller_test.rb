require 'test_helper'

class Api::V1::SocialInterventionDomainCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    sidc = social_intervention_domain_categories(:culture_arts_sports)
    get api_v1_social_intervention_domain_category_url(sidc)
    assert_response :success
  end

  test "should get index" do
    get api_v1_social_intervention_domain_categories_url
    assert_response :success
  end

end
