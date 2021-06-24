# frozen_string_literal: true

class User::NotificationPolicy < ApplicationPolicy
  def update?
    @record.user == @user
  end

  def read?
    update?
  end

  def delete?
    update?
  end

  def unread?
    update?
  end

  class Scope < Scope
    def resolve
      scope.where(user: @user).not_deleted
    end
  end
end
