class UsersController < Clearance::UsersController
	
	def create
		User.create(user_params)
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






 	private

	def user_params
		params.require(:user).permit(:email, :password, :first_name, :last_name, :gender, :phone, :country, :birthdate)
	end

end



