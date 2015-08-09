class OfficeHoursController < ApplicationController
 
  def index
    redirect_curators
    @open_hours = OfficeHour.open(1,'11:00')
  end




  private

  def redirect_curators
    if current_user.role == 2
      flash[:notice] = "Sorry, you're not authorized to access that page"
      redirect_to(curate_url)
    end
  end

end

