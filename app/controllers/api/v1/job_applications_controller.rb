module Api
  module V1
    # Control Job applications api
    class JobApplicationsController < ApplicationController
      # skip_before_action :authenticate_request, only: [:create]
      # before_action :set_job, only: [:show, :destroy]

      def index
        @job_app = JobApplication.all
        render json: @job_app, status: :ok
      end

      def show
        @job_app = JobApplication.find(params[:id])
        change_app_to_seen
        if @job_app
          render json: @job_app, status: :ok
        else
          render json: { error: 'No job applications found' }, status: :no_content
        end
      end

      def create
        @job_app = JobApplication.new(job_application_params)

        if @job_app.save
          render json: @job_app, status: :created
        else
          render json: { error: @job_app.errors.full_message }, status: :unprocessable_entity
        end
      end
    end

    def update
      unless @job_app.update(job_application_params)
        render json: { error: @job_app.errors.full_message }, status: :unprocessable_entity
      end
    end

    def destroy
      @job_app.destroy unless admin?
    end

    private

    def job_application_params
      params.permit(
        :title,
        :user_id,
        :job_id,
        :status,
        :expiry_date
      )
    end

    def change_app_to_seen
      @job_app.update(status: true) if admin?
    end
  end
end

