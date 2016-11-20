class Api::V1::AddressesController < ApplicationController
  respond_to :json
  def show
    respond_with Address.find params[:id]
  end
end
