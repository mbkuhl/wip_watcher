class HobbyistsController < ApplicationController

  def index
    @hobbyists = Hobbyist.all
  end

  def show
    @hobbyist = Hobbyist.find(params[:id])
  end
end