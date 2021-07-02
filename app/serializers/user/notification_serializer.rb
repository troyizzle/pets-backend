# frozen_string_literal: true

class User::NotificationSerializer
  include JSONAPI::Serializer

  attributes :message, :status, :notifiable_id, :notifiable_type
end
