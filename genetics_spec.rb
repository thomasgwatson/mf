require 'rspec'
require_relative 'genetics.rb'

describe Genetic_strand do
  describe "#data" do
    let (:random_string) { "asdfghjkllkjhgfdsa" }
    let (:test_case) { Genetic_strand.new(@random_string) }
    it 'should properly initialize when passed a string' do
      expect(:test_case.strand).to eq @random_string
    end
  end
end