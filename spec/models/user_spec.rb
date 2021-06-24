require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_one(:pet).class_name('User::Pet').dependent(:destroy) }
    it { should have_many(:notifications).class_name('User::Notification').dependent(:destroy) }
  end

  describe 'validations' do
    subject { build(:user) }

    it { should validate_presence_of(:username) }
  end
end
