class Admin::DepartmentsController < ApplicationController
  def index
    @departments = Department.all
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.create(admin_params)
    redirect_to admin_departments_path
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])
    @department.update(admin_params)
    redirect_to admin_departments_path
  end

  def destroy
    @department = Department.find(params[:id])
    @department.delete
    redirect_to admin_departments_path
  end
end

private

def admin_params
  params.require(:department).permit(:name, :abbrev)
end
