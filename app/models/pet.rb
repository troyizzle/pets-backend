# frozen_string_literal: true

class Pet < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_one :backstory, dependent: :destroy, class_name: 'Pets::Backstory'
  accepts_nested_attributes_for :backstory, allow_destroy: true


  has_many :images, dependent: :destroy, class_name: 'Pets::Image'
  accepts_nested_attributes_for :images, allow_destroy: true

  # TODO: Move this to be saved in the database
  MIN_HEALTH = 1
  MAX_HEALTH = 10
  MIN_ATTACK = 1
  MAX_ATTACK = 10
  MIN_HUNGER = 5 
  MAX_HUNGER = 10
  HUNGRY = 2
end
