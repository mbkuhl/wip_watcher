class HobbyistsController < ApplicationController

  def index
    @hobbyists = Hobbyist.all.order(created_at: :desc)
  end

  def show
    @hobbyist = Hobbyist.find(params[:id])
  end

  def show_children
    @hobbyist = Hobbyist.find(params[:id])
    @projects = Hobbyist.find(params[:id]).projects
  end
end