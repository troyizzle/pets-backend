require 'rails_helper'

describe Api::User::PetsController, type: :request do
  let(:user) { create_user }
  let(:path) { '/api/user/pets' }
  let(:pet) { create(:pet) }
  let(:user_pet) { build(:user_pet, pet: pet) }
  let(:pets_background_question) { create(:pets_background_question) }
  let(:pets_background_answer) { create(:pets_background_answer, question: pets_background_question) }

  describe 'create' do
    context 'when the authorization header is missing' do
      before { post path }

      it 'returns 401' do
        expect(response.status).to eq(401)
      end
    end

    context 'when user pet is not valid' do
      before do
        login_with_api(user)
        post path, params: {
          user_pet: {
            name: 'foo',
            gender: 'b'
          }
        }, headers: {
          "Authorization": response.headers['Authorization']
        }
      end
      it 'returns errors' do
        expect(response.status).to eq(422)
      end
    end

    context 'when user pet is valid' do
      before do
        login_with_api(user)
        post path, params: {
          user_pet: {
            name: 'foo',
            gender: 'M',
            pet_id: pet.id,
            backgrounds_attributes: [
              {
                question_id: pets_background_question.id,
                answer_id: pets_background_answer.id
              }
            ]
          }
        },
                   headers: {
                     "Authorization": response.headers['Authorization']
                   }
      end

      it 'successfully adds pet to user' do
        user.reload
        expect(user.pet).to be_present
        expect(user.pet.backgrounds).to be_present
      end
    end
  end
end
