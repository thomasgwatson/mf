require 'rspec'
require_relative 'breakfast'

describe Breakfast do
  context "when there is lots of time" do
    before(:all) do
      @no_rush = Breakfast.new(time: 120, bagels: 13, porridge: 8)
      @porridge = @no_rush.porridge
    end

    describe "#eat_breakfast" do
      it 'should return porridge' do
        expect(@no_rush.eat_breakfast).to eq "Delicious porridge consumed!"
      end

      it "should reduce the amount of porridge by one" do
        expect(@no_rush.porridge).to eq (@porridge-1)
      end
    end
  end
end