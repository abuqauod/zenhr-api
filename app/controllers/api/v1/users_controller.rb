class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: [:show, :destroy]

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    render json: @users, status: :ok
  end

  def create
    @users = User.new(user_params)
    if @users.save
      render json: @users, status: :created
    else
      render json: { error: @users.errors.full_message }, status: :unprocessable_entity
    end
  end

  def update
    unless @users.update(user_params)
      render json: { error: @users.errors.full_message }, status: :unprocessable_entity
    end
  end

  def destroy
    @users.destroy
  end

  private

  def user_params
    params.permit(:name, :username, :email, :password_digest, :is_admin)
  end

  def set_user
    @users = User.find(params[:id])
  end
end
