class Api::V1::EnterpriseCategoriesController < ApplicationController
  include LoginConcern
  authorization_required
  
  respond_to :json

  def index
    respond_with EnterpriseCategory.all
  end

  def show
    respond_with EnterpriseCategory.find params[:id]
  end
end
