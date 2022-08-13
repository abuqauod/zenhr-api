class UserMailer < ApplicationMailer
  default from: 'mqauod2@gmail.com'

  def welcome_email
    @user = params[:user]
    @url = 'http://abuqauod.com/login'
    mail(to: @user.email, subject: 'Welcome to My task')
  end
end