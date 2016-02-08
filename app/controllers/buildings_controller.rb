# Since all of the CRUD actions for buildings are being handled in
# Admin::BuildingsController (as normal users don't have CRUD access), the
# BuildingsController is very thin.
class BuildingsController < ApplicationController
  # Responds jsonified array of elasticsearch(searchkick) building results
  # with keys set to 'name' and building names set as values.
  def autocomplete
    render json: Building.search(params[:query], limit: 10).map { |building| { name: building.fullname, abbrev: building.abbrev } }
  end
end
