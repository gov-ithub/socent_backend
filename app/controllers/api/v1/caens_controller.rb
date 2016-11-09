class Api::V1::CaensController < ApplicationController
  respond_to :json 
  
  def index
    respond_with Caen.all
  end

  def show
    respond_with Caen.find params[:id]
  end
end
