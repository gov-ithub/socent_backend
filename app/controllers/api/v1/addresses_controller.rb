class Api::V1::AddressesController < ApplicationController
  respond_to :json
  def show
    respond_with Address.find params[:id]
  end

  def create
    @address = Address.create!(create_params)
    respond_with @address, status: :created
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

end
