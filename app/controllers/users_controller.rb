class UsersController < Clearance::UsersController

	def create
		# @user = User.create(user_params)
    birthdate = "#{params['dob-year']}-#{params['dob-month']}-#{params['dob-day']}"
    
    @user = User.new(user_params)
    @user.role = params[:user][:role].to_i 
    @user.birthdate = birthdate
    @user.gender = params[:user][:gender].to_i

    @user.save


    EmailJob.perform_later(@user)

		redirect_to sign_in_path
	end

	def edit
		@user = User.find(params[:id])
	end


	def update
		@user = User.find(params[:id])
    if @user.update_attributes(user_params)
    	redirect_to listings_path
    else
      render 'edit'
    end
	end
  def settings
    @users = User.order(:id)

  end

  def edit_setting
    @user = User.find(params[:user_id])

  end

  def update_setting
    @user = User.find(params[:user_id])
    @user.update_attributes(role: params[:user][:role])

    redirect_to users_settings_path


   
  end

 	private

	def user_params
		params.require(:user).permit(:email, :password, :first_name, :last_name, :phone, :country, :birthdate)
	end

end



