# frozen_string_literal: true

class User::Pet::Battle < ApplicationRecord
  belongs_to :winner, class_name: '::User', optional: true
  belongs_to :opponent, class_name: '::User::Pet'
  belongs_to :challenger, class_name: '::User::Pet'
  has_many :actions, dependent: :destroy
  accepts_nested_attributes_for :actions

  after_create :send_notification_to_opponent

  private

  def send_notification_to_opponent
    opponent.user.notifications.create(
      notifiable: self,
      message: 'You have been challeneged to battle!!!'
    )
  end
end
