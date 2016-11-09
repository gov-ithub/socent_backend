class Api::V1::EnterpriseCategoriesController < ApplicationController
  respond_to :json

  def index
    respond_with EnterpriseCategory.all
  end

  def show
    respond_with EnterpriseCategory.find params[:id]
  end
end
