require 'rails_helper'

describe Api::User::NotificationsController, type: :request do
  let(:user) { create(:user) }

  describe 'me' do
    let(:path) { '/api/user/notifications/me' }

    context 'when the autorization header is missing' do
      before { get path }

      it 'returns 401' do
        expect(response.status).to eq(401)
      end
    end

    context 'when when the authorization header is included' do
      before do
        login_with_api(user)
        get path, headers: {
          "Authorization": response.headers['Authorization']
        }
      end

      it 'returns ok response' do
        # TODO: Test for data to be here?
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'read' do
    let(:path) { "/api/user/notifications/#{notification.id}/read" }
    let(:notification) { create(:user_notification, user: user) }

    context 'when the authorization header is missing' do
      before { get path }

      it 'returns 401' do
        expect(response.status).to eq(401)
      end
    end

    context 'when the authorization header is included' do
      context 'when the notification belongs to user' do
        before do
          login_with_api(user)
          get path, headers: {
            "Authorization": response.headers['Authorization']
          }
        end

        it 'returns ok response' do
          expect(response.status).to eq(200)
        end
      end
    end

    context 'when the notification does not belong to user' do
      before do
        login_with_api(create(:user))
        get path, headers: {
          "Authorization": response.headers['Authorization']
        }
      end

      it 'returns not ok response' do
        expect(response.status).not_to eq(200)
      end
    end
  end
end
