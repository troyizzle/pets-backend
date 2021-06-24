module Pets
  module Background
    class AnswerSerializer
      include JSONAPI::Serializer

      belongs_to :question, serializer: Pets::Background::QuestionSerializer

      attributes :answer
    end
  end
end
