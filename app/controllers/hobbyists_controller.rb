class HobbyistsController < ApplicationController

  def index
    @hobbyists = Hobbyist.all
  end

  def show
    @hobbyist = Hobbyist.find(params[:id])
  end

  def show_children
    @hobbyist = Hobbyist.find(params[:id])
    @projects = Hobbyist.find(params[:id]).projects
  end
end