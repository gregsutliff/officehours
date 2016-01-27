class Admin::BuildingsController < ApplicationController
  def index
    @buildings = Building.all
  end

  def show
  end

  def new
    @building = Building.new
    respond_to :html, :js
  end

  def create
    @building = Building.create(admin_params)
    respond_to :html, :js
  end

  def edit
    @building = Building.find(params[:id])
    respond_to :html, :js
  end

  def update
    building = Building.find(params[:id])
    building.update(admin_params)
    redirect_to admin_buildings_path
    respond_to :html, :js
  end

  def destroy
    building = Building.find(params[:id])
    building.delete
  end
end

private

def admin_params
  params.require(:building).permit(:fullname, :abbrev)
end
