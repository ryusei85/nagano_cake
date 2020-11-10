class UsersController < ApplicationController

	before_action :authenticate_end_user!

	def show
		@end_user = EndUser.find(params[:id])
	end

	def edit
		@end_user = EndUser.find(params[:id])
	end

	def update
		@end_user = EndUser.find(params[:id])
		if @end_user.update(end_user_params)
		  redirect_to user_path
		else
		  render 'edit'
		end
	end

	def check
		@end_user = EndUser.find(current_end_user.id)
	end

	def withdrawl
	    @end_user = EndUser.find(current_end_user.id)
	    @end_user.update(is_deleted: "true")
	    reset_session
	    redirect_to root_path
	end

	private

	def end_user_params
       params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :phone_number, :zipcord, :email, :is_active)
    end
end
