class UsersController < Clearance::UsersController
	
	def create
		User.create(user_params)
	end

 	private

	def user_params
		params.require(:user).permit(:email, :password, :first_name, :last_name, :gender, :phone, :country, :birthdate)
	end

	
end



