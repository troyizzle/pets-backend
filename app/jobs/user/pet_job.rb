module User
  class PetJob < ApplicationJob
    queue_as :default

    def perform
    end
  end
end
