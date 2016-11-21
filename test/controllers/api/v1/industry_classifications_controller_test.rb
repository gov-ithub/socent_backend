require 'test_helper'

class Api::V1::IndustryClassificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_industry_classifications_url
    assert_response :success
  end

  test "should get show" do
    industry_classification = industry_classifications(:clasz_0111)
    get api_v1_industry_classification_url(industry_classification)
    assert_response :success
  end

end
