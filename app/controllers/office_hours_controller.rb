class OfficeHoursController < ApplicationController
 
  def index
    redirect_curators
    if params[:building].present?
      @open_hours = OfficeHour.includes(:building, :member, :office, :department).where('buildings.fullname' => params[:building]).open(day, now).order('stop desc')
    else 
      @open_hours = OfficeHour.includes(:member, :building, :office, :department).open(day, now).order('stop desc')
    end
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
      redirect_to(curate_url)
    end
  end


end

