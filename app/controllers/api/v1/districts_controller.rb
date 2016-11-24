class Api::V1::DistrictsController < ApplicationController
  include LoginConcern
  authorization_required

  respond_to :json

  def index
    respond_with District.all
  end

  def show
    respond_with District.find params[:id]
  end
end
