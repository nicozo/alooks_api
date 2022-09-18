class UserMailer < ApplicationMailer

  def reset_password_email(user)
    @user = User.find user.id
    @url = ENV['API_DOMAIN'] + "/reset_password/update?id=" + @user.reset_password_token
    mail(:to => user.email,
         :subject => "Your password has been reset")
  end
end
