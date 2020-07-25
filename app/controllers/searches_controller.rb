class SearchesController < ApplicationController
  def index
    @parents = Department.all
  end
end
