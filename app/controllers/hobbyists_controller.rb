class HobbyistsController < ApplicationController

  def index
    @hobbyists = Hobbyist.all.order(created_at: :desc)
    if params[:order] == "num_hobbies"
      @hobbyists = Hobbyist.sort_by_num_projects
      @hobbyists.each { |hobbyist| hobbyist.set_count(true) }
    end
    if params[:name]
      @hobbyists = Hobbyist.where("name = '#{params[:name]}'")
    end
  end

  def show
    @hobbyist = Hobbyist.find(params[:id])
    @project_count = @hobbyist.projects.count
  end

  def show_projects
    @hobbyist = Hobbyist.find(params[:id])
    @projects = Hobbyist.find(params[:id]).projects
    if params[:order] == "alphabetical"
      @projects = Hobbyist.sort_projects(params[:id])
    end
    if params["Current Completion"]
      @projects = Hobbyist.filter_current_completion(@hobbyist, params["Current Completion"])
    end
  end

  def new

  end

  def create
    Hobbyist.create(
      name: params[:name], 
      weekly_free_hours: params["Weekly Free Hours"], 
      disposible_income: params["Disposible Income"], 
      has_kids: params["Has Kids"])
    redirect_to '/hobbyists'
  end

  def update
    @hobbyist = Hobbyist.find(params[:id])
  end

  def edit
    hobbyist = Hobbyist.find(params[:id])
    hobbyist.update(
      name: params[:name], 
      weekly_free_hours: params["Weekly Free Hours"], 
      disposible_income: params["Disposible Income"], 
      has_kids: params["Has Kids"])
    redirect_to "/hobbyists/#{hobbyist.id}"
  end

  def new_project
    @hobbyist = Hobbyist.find(params[:id])
  end

  def create_project
    hobbyist = Hobbyist.find(params[:id])
    hobbyist.projects.create(
      project_name: params["Project Name"], 
      required_time: params["Required Time"], 
      current_completion: params["Current Completion"], 
      start_cost: params["Start Cost"], 
      cost_rate: params["Cost Rate"])
    redirect_to "/hobbyists/#{hobbyist.id}/projects"
  end

  def destroy
    hobbyist = Hobbyist.find(params[:id])
    projects = hobbyist.projects 
    projects.each { |project| project.destroy}
    Hobbyist.destroy(params[:id])
    redirect_to "/hobbyists"
  end

end