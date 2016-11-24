class Api::V1::VulnerableGroupsController < ApplicationController
  include LoginConcern
  authorization_required
  respond_to :json

  def index
    respond_with VulnerableGroup.all
  end

  def show
    respond_with VulnerableGroup.find params[:id]
  end
end
