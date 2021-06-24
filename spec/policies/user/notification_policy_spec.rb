require 'rails_helper'

describe User::NotificationPolicy do
  subject { described_class }
  let(:user_1) { create(:user) }
  let(:user_2) { create(:user) }
  let(:notification) { create(:user_notification, user: user_1, status: :unread) }

  permissions :update?, :read?, :delete?, :unread? do
    it 'denies access if notification does not belong to user' do
      expect(subject).not_to permit(user_2, notification)
    end

    it 'grants access if notification does belong to user' do
      expect(subject).to permit(user_1, notification)
    end
  end

  describe 'scope' do
    let(:scope) { Pundit.policy_scope(user, User::Notification) }

    context 'notification belonging to user' do
      let(:user) { user_1 }
      let(:deleted_notification) do
        create(:user_notification, user: user, status: :deleted)
      end

      it 'includes notification and does not include deleted_notifications' do
        expect(scope).to include(notification)
        expect(scope).not_to include(deleted_notification)
      end
    end

    context 'notification not belonging to user' do
      let(:user) { user_2 }

      it 'does not include notification' do
        expect(scope).not_to include(notification)
      end
    end
  end
end
