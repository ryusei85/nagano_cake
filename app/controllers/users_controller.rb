class UsersController < ApplicationController

	def show
		@end_user = EndUser.find(params[:id])
	end

	def edit
		@end_user = EndUser.find(params[:id])
	end

	def update
		@end_user = EndUser.find(params[:id])
		@end_user.update(end_user_params)
		redirect_to user_path
	end

	private

	def end_user_params
       params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :phone_number, :deleted, :zipcord, :email)
    end
end
