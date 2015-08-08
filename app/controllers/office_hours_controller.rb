class OfficeHoursController < ApplicationController
 
  def index
    if current_user.role == 2
      redirect_to(curate_url)
    end
  end

end

