"So the first part of the challenge is to write a genetic solver that begins with a population of character strings of length 26 characters and evolves the population until it finds a solution that is the English alphabet, or:"
'abcdefghijklmnopqrstuvwxyz'

# Plan:
# Create a class of objects that are initialized with a random string of 26 letters(If no string is passed to them)
#
# Create a method that runs the genetic processing
# It should test the 'fitness' of each member of the population and take x many of them to 'breed'
# It should breed the fit members in pairs, randomly selecting a crossover point

class Genetic_strand
  @@perfect_string = ('a'..'z').to_a.join
  attr_reader :strand, :fitness
  def initialize(args={})
    @strand = args[:strand] || generate_strand
    @fitness
  end

  def generate_strand
    (0..25).map { ('a'..'z').to_a[rand(26)] }.join
  end
end