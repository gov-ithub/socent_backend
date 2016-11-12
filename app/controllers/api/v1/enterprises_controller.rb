class Api::V1::EnterprisesController < ApplicationController
  respond_to :json

  before_action :set_enterprise, only: [:show, :destroy, :update]

  def show
    respond_with @enterprise
  end

  def index
    respond_with Enterprise.all.includes(
        :primary_industry_classification,
        :enterprise_category,
        :entrepreneur,
        :social_intervention_domain)
  end

  def create
    @enterprise = Enterprise.create(create_params)
    respond_with @enterprise, status: :created
  end

  def destroy
    @enterprise.destroy
    head :no_content
  end

  def update
    @enterprise.update(update_params)
    respond_with @enterprise
  end

  # location response wants 'enterprise' path helpers
  def enterprise_url(enterprise)
    api_v1_enterprise_url(enterprise)
  end

  private

  def create_params
    #ActiveModelSerializers::Deserialization.jsonapi_parse(
    params.permit(
        :number,
        :name,
        :application_date,
        :tax_registration_code,
        :founded_at,
        :contact_name,
        :entrepreneur_id,
        :primary_industry_classification_id,
        :enterprise_category_id,
        :social_intervention_domain_id,
        :industry_classifications)
  end

  def update_params
    params.permit(
        :name,
        :tax_registration_code,
        :founded_at,
        :contact_name,
        :entrepreneur_id,
        :primary_industry_classification_id,
        :enterprise_category_id,
        :social_intervention_domain_id,
        :industry_classifications)
  end

  def set_enterprise
    @enterprise = Enterprise.find params[:id]
  end

end
