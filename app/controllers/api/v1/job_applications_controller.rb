# Get and Edit Job applications
class JobApplicationsController < ApplicationController
  # skip_before_action :authenticate_request, only: [:create]
  # before_action :set_job, only: [:show, :destroy]

  def index
    @jobs = Job.all
    render json: @jobs, status: :ok
  end

  def show
    @jobs = Job.all
    render json: @jobs, status: :ok
  end

  def create
    @jobs = Job.new(job_params)

    if admin?
      if @jobs.save
        render json: @jobs, status: :created
      else
        render json: { error: @jobs.errors.full_message }, status: :unprocessable_entity
      end
    else
      render json: { error: @jobs.errors.full_message }, status: :unauthorized
    end
  end

  def update
    unless @jobs.update(job_params)
      render json: { error: @jobs.errors.full_message }, status: :unprocessable_entity
    end
  end

  def destroy
    @jobs.destroy
  end

  private

  def job_params
    params.permit(:title, :desc, :created_by)
  end

  def set_job
    @jobs = Job.find(params[:id])
  end
end