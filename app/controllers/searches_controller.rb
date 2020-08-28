class SearchesController < ApplicationController
  def index
    @computers = Computer.all.includes(:department)
  end
end
