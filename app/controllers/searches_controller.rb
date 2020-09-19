class SearchesController < ApplicationController
  def index
    @computers = Computer.all.includes(:department)
  end

  def show
    @computer = Computer.find(params[:id])
  end
end
