module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected

    # @return [User]
    def find_verified_user
      reject_unauthorized_connection unless cookies[:token] && cookies[:token].split(' ').size > 1

      token = cookies[:token].split(' ')[1]
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
