class Api::V1::EntrepreneursController < ApplicationController
  respond_to :json

  def show
    respond_with Entrepreneur.find params[:id]
  end

  def index
    respond_with Entrepreneur.all
  end
end
