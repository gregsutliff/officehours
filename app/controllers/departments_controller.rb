# Since all of the CRUD actions for departments are being handled in
# Admin::DepartmentsController (as normal users don't have CRUD access), the
# DepartmentsController is very thin.
class DepartmentsController < ApplicationController
  # Responds jsonified array of elasticsearch(searchkick) department results
  # with keys set to 'name' and departmentment names set as values. This action
  # will be called with jQuery in the OfficeHours index view.
  def autocomplete
    render json: Department.search(params[:query], limit: 10).map { |department| { name: department.name } }
  end
end
