class JobsController < ApplicationController
  doorkeeper_for :create

  respond_to :json

  def index
    respond_with Job.all
  end

  def create
    @job = Job.create(job_params)

    respond_with @job, status: :created
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end
end
