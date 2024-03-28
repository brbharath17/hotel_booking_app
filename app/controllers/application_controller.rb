class ApplicationController < ActionController::Base
  around_action :handle_exceptions
  before_action :set_default_response_format, :current_user

  def handle_exceptions
    begin
      yield
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    rescue ActiveRecord::RecordInvalid => e
      render json: { error: e.message }, status: :unprocessable_entity
    rescue ActionController::ParameterMissing => e
      render json: { error: e.message }, status: :bad_request
    rescue StandardError => e
      render json: { error: e.message }, status: :internal_server_error
    end
  end

  def set_default_response_format
    request.format = :json unless params[:format]
  end

  def current_user
    # TODO: Implement authentication logic here
    @current_user ||= User.first
  end
end
