class Admin::MembersController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    redirect_non_admin
    @members = Member.includes(:department, :building, :office_hours).searching(search_term, sort_column, sort_direction, page)
  end

  def edit
    @current_member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new
    @member.update(admin_params)
    @member.save
    redirect_to admin_members_path
  end

  def update
    flash[:notice] = 'Member was successfully updated.'
    member = Member.find(params[:id])
    member.update(admin_params)
    redirect_to admin_members_path
  end

  def destroy
    Member.delete(params[:id])
    redirect_to admin_members_path
  end

end

private

def admin_params
  params.require(:member).permit(:firstname, :lastname, :building_id, :door_number, :department_id)
end

def redirect_non_admin
  redirect_to root_path unless current_user.role == 1
end

def search_term
  params[:search].blank? ? '*' : params[:search]
end

def page
  params[:page] || 1
end

def sort_column
  %w[firstname lastname building_fullname department_name].include?(params[:sort]) ? params[:sort] : 'department_name'
end

def sort_direction
  %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
end
