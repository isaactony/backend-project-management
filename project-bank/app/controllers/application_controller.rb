class ApplicationController < ActionController::API
    include ActionController::Cookies

    wrap_parameters format: []
    rescue_from ActiveRecord::RecordNotFound, with: :response_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response


    private
    
    def response_not_found
        render json: {error: "#{controller_name.classify} not found"}, status: :not_found
    end

    def unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors}, status: :unprocessable_entity
    end

end
