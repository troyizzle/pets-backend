# frozen_string_literal: true

class User::Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notifiable, polymorphic: true, optional: true
  has_many :battles, as: :notifiable

  validates :message, presence: true

  after_create :broadcast_message

  STATUSES = {
    unread: 0,
    read: 1,
    deleted: 2
  }.freeze

  enum status: STATUSES

  private

  def broadcast_message
    json_msg = ::User::NotificationSerializer.new(self).serializable_hash
    NotificationsChannel.broadcast_to(user, json_msg)
  end
end
