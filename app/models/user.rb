class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  validates :username, presence: true, uniqueness: true

  has_one :pet, dependent: :destroy, class_name: '::User::Pet'
  accepts_nested_attributes_for :pet, allow_destroy: true
  validates_associated :pet

  has_many :notifications, dependent: :destroy
end
