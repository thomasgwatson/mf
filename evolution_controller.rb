require_relative 'genetic_strand.rb'
require_relative 'breeder.rb'

puts Breeder.new({ strands: Array.new(64) { Genetic_strand.new } } ).evolve