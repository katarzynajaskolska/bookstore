module ApiHelpers
  module AuthenticationHelper
    def token_value_from_request
      headers['Authorization']
    end

    def current_user
      AuthenticationToken.find_by(token: token_value_from_request)&.user
    end

    def signed_in?
      current_user.present?
    end

    def authenticate!
      return if signed_in?
      error!({ error_msg: 'authentication_error' }, 401)
    end
  end
end
