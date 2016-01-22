class CarTypesController < ApplicationController
  def index
    head :ok
  end

  def create
    head :created
  end
end
