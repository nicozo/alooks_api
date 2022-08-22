module Api::ErrorRenderable
  extend ActiveSupport::Concern

  private

  def render_error_message(exception = nil, messages = nil)
    render_error(:bad_request, 'Bad Request', exception&.message, *messages)
  end

  def render_error(code, message, *error_messages)
    response = {
      message: message,
      errors: error_messages.compact
    }

    render json: response, status: code
  end
end
