class UsersController < Clearance::UsersController
	
	def create
		User.create(user_params)
		redirect_to listings_path
	end

 	private

	def user_params
		params.require(:user).permit(:email, :password, :first_name, :last_name, :gender, :phone, :country, :birthdate)
	end

	
end



