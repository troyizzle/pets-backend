module Pets
  module Background
    class Question < ApplicationRecord
      has_many :answers, dependent: :destroy, class_name: 'Pets::Background::Answer'

      validates :question, presence: true, uniqueness: true
    end
  end
end
