class Admin::MembersController < ApplicationController
  def index
  	redirect_non_admin
    @members = Member.includes(:department, :building, :office).order(sort_params || 'departments.name')
  end
  def edit
    @current_member = Member.find(params[:id])
  end
  def update
    flash[:notice] = 'Member was successfully updated.'
    redirect_to admin_members_path
  end
  def destroy
  	Member.delete(params[:id])
  	redirect_to admin_members_path
  end
end

private

def redirect_non_admin
  redirect_to root_path unless current_user.role == 1
end

def sort_params
	case params[:sort]
	when 'firstname'
		return 'firstname'
	when 'lastname'
		return 'lastname'
	when 'department'
		return 'departments.name'
	when 'office'
		return 'buildings.fullname'
	else
		return nil
	end
end
