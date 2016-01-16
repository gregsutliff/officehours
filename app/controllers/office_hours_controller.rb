class OfficeHoursController < ApplicationController


  def index

    redirect_curators
    hour = Time.now.hour
    minute = Time.now.min 
    second = Time.now.sec
    time = Time.new(2000, 01, 01, hour, minute, second)
    time = time.strftime('%Y-%m-%dT%H:%M:%S')
    if params[:query].present?
      @open_hours = OfficeHour.search params[:query], where: {
        start: {lt: time},
        stop: {gt: time},
        day: day,
        },
        order: {stop: :desc}
    else 
      @open_hours = OfficeHour.includes(:member, :building, :office, :department).open(day, now).order('stop desc')
    end
  end

  def autocomplete
    render json: OfficeHour.search(params[:query], autocomplete: false, limit: 10).map(&:building_fullname)
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

