# frozen_string_literal: true

class User::Pet::Battle::Action < ApplicationRecord
  belongs_to :battle
  belongs_to :attacker, class_name: '::User::Pet'
  belongs_to :attackee, class_name: '::User::Pet'

  WEAPONS = {
    hands: 0,
    bazooka: 1
  }.freeze

  enum weapon: WEAPONS

  def combat_message
    "#{attacker.name} has hit #{attackee.name} with #{weapon} for #{damage}!"
  end
end
