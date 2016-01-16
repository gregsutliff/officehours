class DepartmentController < ApplicationController
  def index
  	redirect_to root_path && flash[:notice] = "You can't go there" if current_user.role == 3
		department = current_user.department
		@members = department.members.includes(:office, :building, :department)
	end

	def autocomplete
    render json: Department.search(params[:query], limit: 10).map { |department| { name: department.name} }
  end


	private

	def user_params
		params.require(:member_id)
	end
end
