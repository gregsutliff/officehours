class Admin::MembersController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_filter :redirect_non_admin
  def index
    redirect_non_admin
    @members = Member.includes(:department, :building, :office_hours)
                     .searching(search_term, sort_column, sort_direction, page)
    @member = Member.new
  end

  def upload
  end

  def import
    importer = ImportMembersFromCsv.new(params[:file])
    importer.import
    redirect_to admin_members_path, notice: 'Members Imported.'
  end

  def edit
    @current_member = Member.find(params[:id])
    respond_to :js
  end

  def new
    @member = Member.new
    respond_to :js, :html
  end

  def create
    @member = Member.create(member_params)
    respond_to :js, :html, :xml
  end

  def update
    flash[:notice] = 'Member was successfully updated.'
    @member = Member.find(params[:id])
    @member.update(admin_params)
    respond_to :js, :html
  end

  def destroy
    Member.delete(params[:id])
    respond_to do |f|
      f.js
    end
    redirect_to admin_members_path
  end

  private

  def member_params
    params.require(:member).permit(:firstname, :lastname, :building_id,
                                   :door_number, :department_id, :email)
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
    permitted_opts = %w(firstname lastname building_fullname department_name)
    if permitted_opts.include?(params[:sort])
      params[:sort]
    else
      'department_name'
    end
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
