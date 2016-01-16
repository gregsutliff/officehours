class BuildingController < ApplicationController
  def autocomplete
    render json: Building.search(params[:query], limit: 10).map{|building| {name: building.fullname}}
  end
end