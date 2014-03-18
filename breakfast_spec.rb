require 'rspec'
require_relative 'breakfast'

describe Breakfast do
  context "when there is lots of time" do
    before(:all) do
      @no_rush = Breakfast.new(time: 120, food: { bagels: 13, porridge: 8} )
      @porridge = @no_rush.food[:porridge]
      @bagels = @no_rush.food[:bagels]
    end

    describe "#eat_breakfast" do
      it 'should return porridge' do
        expect(@no_rush.eat_breakfast).to eq "Delicious porridge consumed!"
      end

      it "should reduce the amount of porridge by one" do
        expect(@no_rush.food[:porridge]).to eq (@porridge-1)
      end

      it "should make bagels if there isn't time" do
        @no_rush.time = 28
        expect(@no_rush.eat_breakfast).to eq "Delicious bagels consumed!"
      end

      it "should reduce the amount of porridge by one" do
        expect(@no_rush.food[:bagels]).to eq (@bagels-1)
      end
    end
  end

  context "when there is no food" do
    before(:all) do
      @no_food = Breakfast.new(time: 120, food: { bagels: 0, porridge: 0} )
    end

    describe "#eat_breakfast" do
      it 'should state that Tom is starving' do
        expect(@no_food.eat_breakfast).to eq "Tom is starving :("
      end
    end
  end
end