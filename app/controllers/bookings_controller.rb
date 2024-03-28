class BookingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @booking = current_user.bookings.build(booking_params)
    # TODO: Add validation to ensure that the user is not booking a hotel that they have already booked
    # TODO: Add validation to ensure that the hotel_id is valid
    # TODO: Add validation to ensure that the check_in date is in the future
    # TODO: Add validation to ensure that the rooms are available for the check_in and check_out dates
    @booking.save!
  end

  def update
    @booking = current_user.bookings.find(params[:id])
    # TODO: Add validation to ensure that the user is not booking a hotel that they have already booked
    # TODO: Add validation to ensure that the hotel_id is valid
    # TODO: Add validation to ensure that the check_in date is in the future
    # TODO: Add validation to ensure that the rooms are available for the check_in and check_out dates
    @booking.update!(booking_params)
  end

  def cancel
    @booking = current_user.bookings.find(params[:id])
    # TODO: Free up the rooms that were booked
    @booking.canceled!

    render json: { status: 'success', message: 'Booking cancelled successfully' }
  end

  private

  def booking_params
    params.permit(:check_in, :check_out, :hotel_id, :number_of_guests, :number_of_rooms)
  end
end
