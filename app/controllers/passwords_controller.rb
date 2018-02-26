class PasswordsController < Clearance::PasswordsController

  def create
    UserMailer.password_recorvery_email(params[:password][:email]).deliver_now
    render plain: 'An email for resetting your password will get send to you email shortly'
  end

  def update

  end

end