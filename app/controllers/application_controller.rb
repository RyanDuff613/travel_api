class ApplicationController < ActionController::API
  include Response

  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message}, :not_found)
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    json_response({ message: exception.message}, :unprocessable_entity)
  end

  # rescue_from ActiveRecord::NoContent do |exception|
  #   json_response({ message: exception.message}, :no_content)
  # end

  # rescue_from ActiveRecord::ArgumentError do |exception|
  #   json_response({ message: exception.message}, :internal_server_error)
  # end

end
