class ProjectsController < ApplicationController

  def index
    @projects = Project.where(active: true)
  end

  def show
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
  end

  def edit
    project = Project.find(params[:id])
    project.update(
      project_name: params["Project Name"], 
      required_time: params["Required Time"], 
      current_completion: params["Current Completion"], 
      start_cost: params["Start Cost"], 
      cost_rate: params["Cost Rate"],
      active: params["Active"],
      completed: params["Completed"],
      abandoned: params["Abandoned"]
    )
    redirect_to "/projects/#{project.id}"
  end

end