require 'rails_helper'

RSpec.describe Pets::Background::Question, type: :model do
  describe 'associations' do
    it { should have_many(:answers).class_name('Pets::Background::Answer' )}
  end

  describe 'validations' do
    subject { build(:pets_background_question) }

    it { should validate_presence_of(:question) }
  end
end
