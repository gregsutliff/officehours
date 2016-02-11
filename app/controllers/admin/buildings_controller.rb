class Admin::BuildingsController < ApplicationController
  before_filter :redirect_non_admin
  def index
    @buildings = Building.all
    respond_to :html, :js
  end

  def show
  end

  def new
    @building = Building.new
    respond_to :html, :js
  end

  def create
    @building = Building.create(building_params)
    respond_to :html, :js, :xml
  end

  def edit
    @building = Building.find(params[:id])
    respond_to :html, :js
  end

  def update
    building = Building.find(params[:id])
    building.update(building_params)
    redirect_to admin_buildings_url && return
    respond_to :html, :js
  end

  def destroy
    building = Building.find(params[:id])
    building.delete
  end

  private

  def building_params
    params.require(:building).permit(:fullname, :abbrev, :avatar)
  end

  def redirect_non_admin
    redirect_to root unless current_user.role == 1
  end
end
