class HobbyistsController < ApplicationController

  def index
    @hobbyists = Hobbyist.all.order(created_at: :desc)
  end

  def show
    @hobbyist = Hobbyist.find(params[:id])
    @project_count = @hobbyist.projects.count
  end

  def show_projects
    @hobbyist = Hobbyist.find(params[:id])
    @projects = Hobbyist.find(params[:id]).projects
  end

  def new

  end

  def create
    Hobbyist.create(name: params[:name], weekly_free_hours: params["Weekly Free Hours"], disposible_income: params["Disposible Income"], has_kids: params["Has Kids"])
    redirect_to '/hobbyists'
  end

  def new_project
    @hobbyist = Hobbyist.find(params[:id])
  end

  def create_project
    hobbyist = Hobbyist.find(params[:id])
    hobbyist.projects.create(project_name: params["Project Name"], required_time: params["Required Time"], current_completion: params["Current Completion"], start_cost: params["Start Cost"], cost_rate: params["Cost Rate"])
    redirect_to "/hobbyists/#{hobbyist.id}/projects"
  end
end