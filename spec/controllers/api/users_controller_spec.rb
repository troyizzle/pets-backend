require 'rails_helper'

describe Api::UsersController, type: :request do
  let (:user) { create_user }

  context 'when fetching a user' do
    before do
      login_with_api(user)
      get "/api/users/#{user.id}", headers: {
        'Authorization': response.headers['Authorization']
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    pending("Check for return values")
  end

  context 'when a user is missing' do
    before do
      login_with_api(user)
      get "/api/users/blank", headers: {
        "Authorization": response.headers['Authorization']
      }
    end

    it 'returns 404' do
      expect(response.status).to eq(404)
    end
  end

  context 'when the authorization header is missing' do
    before { get "/api/users/#{user.id}" }

    it 'returns 401' do
      expect(response.status).to eq(401)
    end
  end
end
