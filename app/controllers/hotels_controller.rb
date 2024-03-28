class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
    @hotels = @hotels.where(city: params[:city_id]) if params[:city_id].present?
  end
end
