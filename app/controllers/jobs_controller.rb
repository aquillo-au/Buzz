class JobsController < ApplicationController
  before_action :find_job, only: %i[show complete]

  def new
    @task = Task.find(params[:task_id])
    @job = Job.new
    @people = find_people
    authorize @task
    authorize @job
  end

  def create
    @job = Job.new(job_params)
    @task = Task.find(params[:task_id])
    @job.task = @task
    authorize @job
    if @job.save
      redirect_to task_path(@task)
      flash[:notice] = 'job Created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def complete
    @job.status = true
    @task = @job.task
    authorize @job
    if @job.save
      redirect_to task_path(@task)
      flash[:notice] = 'Job completed'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_people
    people = []
    @task.project.teams.each do |team|
      people << team.users
    end
    people.flatten
  end

  def job_params
    params.require(:job).permit(:title, :user_id)
  end

  def find_job
    @job = Job.find(params[:id])
  end
end
