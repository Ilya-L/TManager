class TasksController < ApplicationController


def index
    @tasks = Task.all
  end

def show
    @task = Task.find(params[:id])
    @projects = Project.where("name = ?", @task.project_name) 
end

def new

@project_options = Project.all.map{|p| [p.name, p.name]}
@user_options = User.all.map{|u| [u.last_name + u.first_name, u.last_name + u.first_name]}
@task = Task.new
end


def edit
  @task = Task.find(params[:id])
@project_options = Project.all.map{|p| [p.name, p.name]}
@user_options = User.all.map{|u| [u.last_name + u.first_name, u.last_name + u.first_name]}
end

def create
@project_options = Project.all.map{|p| [p.name, p.name]}
@user_options = User.all.map{|u| [u.last_name + u.first_name, u.last_name + u.first_name]}
@task = Task.new(task_params)

  if @task.save
  redirect_to @task
else 
render 'new'
end
end

def update
  @task = Task.find(params[:id])
 
  if @task.update(task_params)
    redirect_to @task
  else
    render 'edit'
  end
end

def destroy
  @task = Task.find(params[:id])
  @task.destroy
 
  redirect_to tasks_path
end

private
def task_params
params.require(:task).permit(:title,  :description, :project_name, :implementer, :status)
end
end
