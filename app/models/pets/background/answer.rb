module Pets
  module Background
    class Answer < ApplicationRecord
      belongs_to :question, class_name: 'Pets::Background::Question'

      validates :answer, presence: true
    end
  end
end
