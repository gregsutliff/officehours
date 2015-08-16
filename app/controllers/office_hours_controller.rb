class OfficeHoursController < ApplicationController
 
  def index
    redirect_curators
    @open_hours = OfficeHour.includes(:member, :building).open(day, now)
  end




  private

	def now
		Time.now.strftime('%H:%M')	
	end

	def day
		Time.now.strftime('%w')
	end

  def redirect_curators
    if current_user.role == 2
      flash[:notice] = "Sorry, you're not authorized to access that page"
      redirect_to(curate_url)
    end
  end

end

