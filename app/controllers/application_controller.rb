class ApplicationController < ActionController::API
  #Create authenticate_request function
  include JsonWebToken
  #skip_before_action :authenticate_request, only: [:create, :show, :index]
  before_action :authenticate_request

  private

  def authenticate_request
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    decoded = jwt_decode(header)
    @current_user = User.find(decoded[:user_id])
  end

  def admin?
    @current_user && @current_user.is_admin == true
  end
end

#Create authentication controller # rails g controller authentication