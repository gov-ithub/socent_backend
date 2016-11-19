class Api::V1::SocialInterventionDomainsController < ApplicationController
  respond_to :json

  def show
    respond_with SocialInterventionDomain.find params[:id]
  end

  def index
    respond_with SocialInterventionDomain.all.includes(:social_intervention_domain_category)
  end
end
