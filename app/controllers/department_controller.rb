class DepartmentController < ApplicationController
  def curate
		if current_user.role == 3
			redirect_to root_path
			flash[:notice] = "You can't go there"
		end
		department = current_user.department
		@members = department.members.includes(:office, :building, :department)
	end

	def edit_member
		@current_member = Member.find(user_params)
	end

	private

	def user_params
		params.require(:member_id)
	end
end
