require 'rails_helper'

describe Api::User::Pet::BattlesController, type: :request do
  let(:path) { '/api/user/pet/battles' }
  let(:user) { create(:user) }
  let(:user_pet) { create(:user_pet, user: user) }
  let(:user_pet2) { create(:user_pet) }

  describe 'create' do
    context 'when the authorization header is missing' do
      before { post path }

      it 'returns 401' do
        expect(response.status).to eq(401)
      end
    end

    context 'when authorization header is included' do
      before do
        login_with_api(user)
        post path, params: {
          user_pet_battle: {
            opponent_id: user_pet.id,
            challenger_id: user_pet2.id
          }
        },
                   headers: {
                     "Authorization": response.headers['Authorization']
                   }
      end

      it 'successfully creates battle' do
        expect(response.status).to eq(200)
      end
    end
  end
end
