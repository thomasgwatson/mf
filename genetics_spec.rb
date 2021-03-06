require 'rspec'
require_relative 'genetic_strand.rb'
require_relative 'breeder.rb'

describe Genetic_strand do
  let! (:no_args_case) { Genetic_strand.new }
  let (:alphabet) { ('a'..'z').to_a.join }
  let (:perfect_case) { Genetic_strand.new({ strand: alphabet }) }
  let (:imperfect_case) { Genetic_strand.new({ strand: ('a'..'z').to_a.rotate.join }) }
  let (:near_perfect_case) { Genetic_strand.new({ strand: ('a'..'y').to_a.join + 'y' }) }

  describe "basic behaviour" do
    let (:random_string) { "asdfghjkllkjhgfdsa" }
    let (:args_case) { Genetic_strand.new({ strand: random_string }) }
    it 'should properly initialize when passed a string' do
      expect(args_case.strand).to eq random_string
    end

    it 'should create a randomised string of 26 characters when no arguments are passed' do
      expect(no_args_case.strand.length).to eq 26
    end
  end

  describe "#fitness" do

    it 'should return a score of one for a perfect_case' do
      expect(perfect_case.fitness).to eq 1
    end

    it 'should return a score just below 1 for a less than perfect_case' do
      expect(near_perfect_case.fitness).to eq 0.9615384615384616
    end

    it 'should return a score of zero for a completely imperfect_case' do
      expect(imperfect_case.fitness).to eq 0
    end
  end

  describe "#mutate" do
    let! (:mutated_case) { Genetic_strand.new({ strand: alphabet }).mutate }
    it 'should change only one character in the string' do
      expect(mutated_case.fitness).to eq 0.9615384615384616
    end
  end
end

describe Breeder do
  let (:alphabet) { ('a'..'z').to_a.join }
  let (:almost_alphabet) { ('a'..'y').to_a.join + 'y' }
  let (:less_fit_strand) { Genetic_strand.new({ strand: almost_alphabet }) }
  let (:fittest_strand) { Genetic_strand.new({ strand: alphabet }) }
  let (:strands) { Array.new(64) { Genetic_strand.new } }
  let (:basic_breeder) { Breeder.new({ strands: strands }) }
  let (:fitness_test_breeder) { Breeder.new({ strands: [less_fit_strand, fittest_strand] }) }

  describe "#initialize" do
    it 'should create an array of 64 strands for breeding' do
      expect(basic_breeder.strands.count).to eq 64
      expect(basic_breeder.strands.first.strand.length).to eq 26
    end
  end

  describe "#order_by_fitness" do
    it "should reorder the strands highest to lowest, by their fitness" do
      expect(fitness_test_breeder.order_by_fitness).to eq [fittest_strand, less_fit_strand]
    end
  end

  describe ".slice_and_switch" do
    it "should slice and switch the strings at an appropriate point" do
      expect(Breeder.slice_and_switch("lend", "game", 2)).to eq ['leme','gand']
    end
  end

  describe "#evolve" do
    it 'should return a candidate whose strand matches the alphabet' do
      expect(basic_breeder.evolve).to eq alphabet
    end
  end
end