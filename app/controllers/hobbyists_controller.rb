class HobbyistsController < ApplicationController

  def index
    @hobbyists = Hobbyist.all.order(created_at: :desc)
  end

  def show
    @hobbyist = Hobbyist.find(params[:id])
    @project_count = @hobbyist.projects.count
  end

  def show_children
    @hobbyist = Hobbyist.find(params[:id])
    @projects = Hobbyist.find(params[:id]).projects
  end

  def new

  end

  def create
    Hobbyist.create(name: params[:name], weekly_free_hours: params["Weekly Free Hours"], disposible_income: params["Disposible Income"], has_kids: params["Has Kids"])
    redirect_to '/hobbyists'
  end
end