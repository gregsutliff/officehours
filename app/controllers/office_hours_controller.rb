class OfficeHoursController < ApplicationController
  def index
    redirect_curators
    get_hours
  end

  private

  def now
    Time.now.strftime('%H:%M')
  end

  def day
    Time.now.strftime('%w')
  end

  def redirect_curators
    redirect_to(curate_url) if current_user.role == 2
  end

  def get_hours
    if params[:query].present?
      time = Time.now.strftime('2000-01-01T%H:%M:%S')
      @open_hours = OfficeHour.search params[:query],
      where: {
        start: { lt: time },
        stop: { gt: time },
        day: day
      },
      order: { stop: :desc }
    else
      @open_hours = OfficeHour
                    .includes(:member, :building, :office, :department)
                    .open(day, now).order('stop desc')
    end
  end
end
