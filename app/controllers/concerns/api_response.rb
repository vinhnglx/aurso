module ApiResponse
  extend ActiveSupport::Concern

  private

    # Private: Handle not_found request
    #
    # Returns not_found status
    def respond_404
      head :not_found
    end
end
