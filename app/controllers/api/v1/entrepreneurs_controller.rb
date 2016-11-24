class Api::V1::EntrepreneursController < ApplicationController
  include LoginConcern
  authorization_required
  
  respond_to :json

  before_action :set_entrepreneur, only: [:show, :update, :destroy]

  def show
    respond_with @entrepreneur
  end

  def index
    respond_with Entrepreneur.all
  end

  def create
    @entrepreneur = Entrepreneur.create(create_params)
    respond_with @entrepreneur, status: :created
  end

  def update
    @entrepreneur.update(update_params)
    respond_with @entrepreneur
  end

  def destroy
    @entrepreneur.destroy
    head :no_content
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

  def update_params
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

  def set_entrepreneur
    @entrepreneur = Entrepreneur.find params[:id]
  end
end
