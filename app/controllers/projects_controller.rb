class ProjectsController < ApplicationController
def index
    @projects = Project.all
    @tasks = Task.all
  end

def show
    @project = Project.find(params[:id])
    @tasks = Task.where("project_name = ?", @project.name) 
end

def new
@project = Project.new
end


def edit
  @project = Project.find(params[:id])
end

def create
@project = Project.new(project_params)
 
  if @project.save
  redirect_to @project
else 
render 'new'
end
end

def update
  @project = Project.find(params[:id])
 
  if @project.update(project_params)
    redirect_to @project
  else
    render 'edit'
  end
end

def destroy
  @project = Project.find(params[:id])
  @project.destroy
  Task.where("project_name = ?", @project.name).destroy_all
 
  redirect_to projects_path
end

private
def project_params
params.require(:project).permit(:name, :summary, :start_date, :end_date)
end
end
