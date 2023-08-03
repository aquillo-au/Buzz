class WorkersController < ApplicationController
  def new
    @worker = Worker.new
    authorize @worker
  end

  def create
    @worker = Worker.new(project_params)

    # @project.user_id = current_user.id
    authorize @worker
    if @worker.save
      redirect_to projects_path, notice: 'project was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def worker_params
    params.require(:worker).permit(:name, :phone, :pay_rate)
  end
end
