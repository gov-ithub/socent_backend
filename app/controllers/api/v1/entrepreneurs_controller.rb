class Api::V1::EntrepreneursController < ApplicationController
  respond_to :json

  def show
    respond_with Entrepreneur.find params[:id]
  end

  def index
    respond_with Entrepreneur.all
  end

  def create
    @entrepreneur = Entrepreneur.create(create_params)
    respond_with @entrepreneur, status: :created
  end

  # location response wants 'entrepreneur' path helpers
  def entrepreneur_url(entrepreneur)
    api_v1_entrepreneur_url(entrepreneur)
  end

  private

  def create_params
    params.permit(
      :identification_number,
      :name,
      :card_type,
      :card_series,
      :card_number,
      :issued_by,
      :designation,
      :proof_of_designation_url)
  end
end
