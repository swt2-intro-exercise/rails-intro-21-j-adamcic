require 'rails_helper'

RSpec.describe Paper, type: :model do
  context "with paper named COMPUTING MACHINERY AND INTELLIGENCE" do
    alan = FactoryBot.create :paper
    it "initializes properly" do
      expect(alan.title).to eq('COMPUTING MACHINERY AND INTELLIGENCE')
      expect(alan.venue).to eq('Mind 49: 433-460')
      expect(alan.year).to eq(1950)
    end
  end
end
