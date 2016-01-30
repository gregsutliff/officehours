class Admin::DepartmentsController < ApplicationController
  def index
    @departments = Department.all
    respond_to :html, :js
  end

  def new
    @department = Department.new
    respond_to :html, :js
  end

  def create
    @department = Department.create(department_params)
    respond_to :html, :js, :xml
  end

  def edit
    @department = Department.find(params[:id])
    respond_to :html, :js
  end

  def update
    @department = Department.find(params[:id])
    @department.update(admin_params)
    respond_to :html, :js
  end

  def destroy
    @department = Department.find(params[:id])
    @department.delete
    redirect_to admin_departments_path
  end

  private

    def department_params
      params.require(:department).permit(:name, :abbrev)
    end
end


