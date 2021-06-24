require 'rails_helper'

RSpec.describe User::Notification, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
  end

  describe 'validations' do
    subject { build(:user_notification) }

    it { should validate_presence_of(:message) }
  end
end
