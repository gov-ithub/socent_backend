class Api::V1::EnterprisesController < ApplicationController
  respond_to :json

  def show
    respond_with Enterprise.find params[:id]
  end

  def index
    respond_with Enterprise.all
  end

  def create
    raise 'todo'
  end

  def destroy
    raise 'todo'
  end

  def update
    raise 'todo'
  end
end
