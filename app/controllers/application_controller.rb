class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    def not_found(e)
        puts e
        render json: {message:"record not found", errors: e} , status: :not_found
      end
end
