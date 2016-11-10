class Api::V1::SocialInterventionDomainCategoriesController < ApplicationController
  respond_to :json

  def show
    respond_with SocialInterventionDomainCategory.find params[:id]
  end

  def index
    respond_with SocialInterventionDomainCategory.all
  end
end
