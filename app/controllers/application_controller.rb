class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    private

    def render_unprocessable_entity_response invalid
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end 

    def render_not_found_response error
        render json: {errors: {error.model => "Not Found"}}, status: :not_found
    end 

end
