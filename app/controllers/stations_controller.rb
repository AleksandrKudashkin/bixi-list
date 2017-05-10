class StationsController < ApplicationController
  before_action :update_data

  def index
    @min_distance = params[:min_distance] || 0
    @stations = Station.active_with_bikes
                       .where("DISTANCE > ?", @min_distance)
                       .order(:distance)
                       .order(bikes: :desc)
                       .limit(PAGE_LIMIT)
    @last_update = last_update
  end

  private

  def update_data
    Station.update_data && return unless last_update
    Station.update_data if last_update < REFRESH_TIMEOUT.minutes.ago
  end

  def last_update
    Station.maximum(:updated_at)
  end
end
