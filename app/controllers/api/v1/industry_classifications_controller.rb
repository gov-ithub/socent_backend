class Api::V1::IndustryClassificationsController < ApplicationController
  include LoginConcern
  authorization_required
  respond_to :json 
  
  def index
    respond_with IndustryClassification.all
  end

  def show
    respond_with IndustryClassification.find params[:id]
  end
end
