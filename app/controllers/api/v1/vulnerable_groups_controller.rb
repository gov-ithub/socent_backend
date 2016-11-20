class Api::V1::VulnerableGroupsController < ApplicationController
  respond_to :json

  def index
    respond_with VulnerableGroup.all
  end

  def show
    respond_with VulnerableGroup.find params[:id]
  end
end
