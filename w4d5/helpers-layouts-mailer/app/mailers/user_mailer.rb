class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url = 'http://www.appacademy.io'

    mail(to: user.email, subject: 'Welcome!')

  end
end
