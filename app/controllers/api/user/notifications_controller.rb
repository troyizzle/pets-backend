module Api
  module User
    class NotificationsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_notification, only: %w[read unread delete]

      def me
        @notifications = policy_scope(::User::Notification)
        render json: ::User::NotificationSerializer.new(@notifications, collection: true).serializable_hash
      end

      def read
        @notification.update(status: :read)
        render json: ::User::NotificationSerializer.new(@notification).serializable_hash
      end

      def unread
        @notification.update(status: :unread)
        render json: ::User::NotificationSerializer.new(@notification).serializable_hash
      end

      def delete
        @notification.update(status: :deleted)
        render json: ::User::NotificationSerializer.new(@notification).serializable_hash
      end

      private

      def set_notification
        @notification = authorize ::User::Notification.find(params[:id])
      end
    end
  end
end
