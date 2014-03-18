require 'rspec'
require_relative 'genetics.rb'

describe Genetic_strand do
  describe "basic behaviour" do
    let (:random_string) { "asdfghjkllkjhgfdsa" }
    let (:args_case) { Genetic_strand.new({ strand: random_string }) }
    let (:no_args_case) { Genetic_strand.new }
    it 'should properly initialize when passed a string' do
      expect(args_case.strand).to eq random_string
    end

    it 'should create a randomised string of 26 characters when no arguments are passed' do
      expect(no_args_case.strand.length).to eq 26
    end
  end

  describe "fitness" do

  end
end