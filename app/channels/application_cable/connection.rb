module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected

    # @return [User]
    def find_verified_user
      token = request.params[:token]
      reject_unauthorized_connection unless token

      # On production the token seems to be parsing the spacing
      split_by = token.include?(' ') ? ' ' : '%20'
      reject_unauthorized_connection unless token.split(split_by).size > 1

      token = token.split(split_by)[1]
      jwt = JWT.decode(token, Rails.application.credentials.devise_jwt[:secret_key], true, algorithm: 'HS256',
                                                                                           verify_jti: true)[0]
      if (user = User.find(jwt['sub']))
        user
      else
        reject_unauthorized_connection
      end
    end
  end
end
