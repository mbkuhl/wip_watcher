class ProjectsController < ApplicationController

  def index
    @projects = Project.where(active: true)
    if params["Project Name"]
      @projects = Project.where("project_name like ?", "%#{params["Project Name"]}%")
    end
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

  def destroy
    Project.destroy(params[:id])
    redirect_to "/projects"
  end

end