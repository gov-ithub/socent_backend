class Api::V1::SocialInterventionDomainCategoriesController < ApplicationController
  include LoginConcern
  authorization_required
  respond_to :json

  def show
    respond_with SocialInterventionDomainCategory.find params[:id]
  end

  def index
    respond_with SocialInterventionDomainCategory.all
  end
end
