module Pets
  module Background
    class QuestionSerializer
      include JSONAPI::Serializer

      has_many :answers, serializer: Pets::Background::AnswerSerializer

      attributes :question

      attributes :answers do |question|
        question.answers
      end
    end
  end
end
