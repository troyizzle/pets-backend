require 'rails_helper'

RSpec.describe Pets::Image, type: :model do
  describe 'associations' do
    it { should belong_to(:pet).class_name('Pet') }
  end
end
