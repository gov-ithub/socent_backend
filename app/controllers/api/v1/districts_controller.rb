class Api::V1::DistrictsController < ApplicationController
  respond_to :json

  def index
    respond_with District.all
  end

  def show
    respond_with District.find params[:id]
  end
end
