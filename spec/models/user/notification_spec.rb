require 'rails_helper'

RSpec.describe User::Notification, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should belong_to(:notifiable).optional(:true) }
  end

  describe 'database' do
    it { should have_db_column(:notifiable_id).of_type(:integer) }
    it { should have_db_column(:notifiable_type).of_type(:string) }
  end

  describe 'validations' do
    subject { build(:user_notification) }

    it { should validate_presence_of(:message) }
  end
end
