class OfficeHoursController < ApplicationController
 
  def index
    if current_user.role == 2
      flash[:notice] = "Sorry, you're not authorized to access that page"
      redirect_to(curate_url)
    end
  end

end

