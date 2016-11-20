class Api::V1::AddressesController < ApplicationController
  respond_to :json

  before_action :set_address, only: [:show, :update, :destroy]

  def show
    respond_with @address
  end

  def create
    @address = Address.create!(create_params)
    respond_with @address, status: :created
  end

  def update
    @address.update(update_params)
    respond_with @address
  end

  def destroy
    @address.destroy
    head :no_content
  end

  # location response wants 'address' path helpers
  def address_url(address)
    api_v1_address_url(address)
  end

  private

  def create_params
    params.permit(
      :city,
      :street,
      :street_number,
      :phone,
      :fax,
      :email,
      :district_id)
  end

  def update_params
    params.permit(
      :city,
      :street,
      :street_number,
      :phone,
      :fax,
      :email,
      :district_id)
  end

  def set_address
    @address = Address.find params[:id]
  end
end
