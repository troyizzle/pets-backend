module Api
  module Pets
    module Background
      class QuestionsController < ApplicationController
        def index
          @pets_background_questions = ::Pets::Background::Question.all

          options = { include: %i[answers], collection: true }
          render json: ::Pets::Background::QuestionSerializer.new(@pets_background_questions,
            options).serializable_hash
        end
      end
    end
  end
end
