class ApplicationController < ActionController::API
  include ApiResponse

  rescue_from ::ActiveRecord::RecordInvalid do |exception|
    rescue_errors(exception.message, :bad_request)
  end

  protected

    # Protected: Catch the error ActiveRecord::RecordInvalid
    #
    # message - Exception message
    # status  - Error status
    #
    # Examples
    #
    #   rescue_errors('Validation failed: Name can't be blank', :bad_request)
    #   # => { message: 'Validation failed: Name can't be blank' }, status: :bad_request
    #
    # Returns the JSON error message
    def rescue_errors(message, status)
      render json: { message: message }, status: status
    end
end
