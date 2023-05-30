class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save
    redirect_to task_path(task)
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to task_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
