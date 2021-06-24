# frozen_string_literal: true

class User::Pet::Background < ApplicationRecord
  belongs_to :pet, class_name: 'User::Pet'
  belongs_to :question, class_name: 'Pets::Background::Question'
  belongs_to :answer, class_name: 'Pets::Background::Answer'
end
