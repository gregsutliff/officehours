class OfficeHoursController < ApplicationController
  def index
    fetch_hours
  end

  private

  # #now returns the current time as a string in 24-hour format.
  def now
    Time.now.strftime('%H:%M')
  end

  # #day returns the current day as an integer 0..6 where Sunday is 0
  def day
    Time.now.strftime('%w')
  end

  # #fetch_hours is used to assign @open_hours an array (or array-like object)
  # that will be used to populate the view with all of the open office hours,
  # or some proper subset of open office hours that satisfies a provided search
  # query.
  def fetch_hours
    # If a query parameter has been passed, then #fetch_hours assigns
    # @open_hours a SearchKick::Results object, containing all of the
    # open office hours that satisfy the query. SearchKick::Resuls objects
    # respond like arrays to most methods.
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
      # If no query string is provided, then @open_hours is assigned an
      # ActiveRecord object containing all of the open office hours.
      # Associated Members, Departments, and Buildings are included to prevent
      # n+1 queries.
      @open_hours = OfficeHour
                    .includes(:member, :building, :department)
                    .open(day, now).order('stop desc')
    end
  end
end
