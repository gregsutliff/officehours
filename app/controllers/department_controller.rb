class DepartmentController < ApplicationController
  def curate
		if current_user.role == 3
			redirect_to root_path
			flash[:notice] = "You can't go there"
		end
  end
end
