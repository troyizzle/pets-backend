require 'rails_helper'

RSpec.describe User::Pet::Background, type: :model do
  describe 'associations' do
    it { should belong_to(:pet).class_name('User::Pet') }
    it { should belong_to(:question).class_name('Pets::Background::Question') }
    it { should belong_to(:answer).class_name('Pets::Background::Answer') }
  end
end
