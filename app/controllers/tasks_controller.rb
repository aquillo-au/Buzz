class TasksController < ApplicationController
  before_action :find_task, only: %i[show complete]
  def index
    @tasks = policy_scope(Task)
    @project = Project.all
  end

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
    authorize @project
    authorize @task
  end

  def show
    authorize @task
  end

  def complete
    @task.status = 'completed'
    @project = @task.project
    authorize @task
    if @task.save
      redirect_to project_tasks_path(@project)
      flash[:notice] = 'Task completed'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create
    @task = Task.new(task_params)
    @project = Project.find(params[:project_id])
    @task.project = @project
    authorize @task
    if @task.save
      redirect_to project_tasks_path(@project)
      flash[:notice] = 'Task Created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :estimated_time, :due_date, :description)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
