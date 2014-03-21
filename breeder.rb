require_relative 'genetic_strand.rb'

# How many strands does the Breeder hold? As many as you want
# How often to
# Will it keep track of generations of breeding?
# How will it determine the cross over

class Breeder
  attr_reader :strands
  def initialize(args={})
    @strands = args[:strands] || []
  end

  def evolve
    best_candidate = self.strands[0]
    generation_counter = 0
    self.order_by_fitness
    while best_candidate.strand != ('a'..'z').to_a.join
      self.mutate_all
      self.select_and_breed
      self.order_by_fitness
      generation_counter += 1
      best_candidate = self.strands[0]
      # if generation_counter % 10 == 0
      #   puts "#{generation_counter} ###"
      #   puts best_candidate.strand
      #   puts self.strands[0].fitness
      #   puts self.strands[-1].fitness
      # end
    end
    best_candidate.strand
  end

  def order_by_fitness
    @strands = self.strands.sort { |strand_a, strand_b| strand_b.fitness <=> strand_a.fitness }
  end

  def mutate_all
    @strands.each { |strand| strand.mutate }
  end

  def cleanse_population
    @strands.reject! { |strand| strand.strand.length != 26}
  end

  def show_strands
    @strands.each { |strand| puts strand.strand }
  end

  def breed(strand_a, strand_b)
    pair = []
    children = Breeder.slice_and_switch(strand_a, strand_b)
    pair << Genetic_strand.new({ strand: children[0] })
    pair << Genetic_strand.new({ strand: children[1] })
  end

  def select_and_breed

    breeding_pair = []
    strand_a = @strands[0].strand
    strand_b = @strands[1].strand
    new_generation = breed(strand_a, strand_b)

    until new_generation.length == 64
      until breeding_pair.length == 2
        minimum = @strands[-1].fitness
        selection_standard = (rand(100)+1)/100.0 + minimum
        candidate = @strands.sample
        breeding_pair << candidate if candidate.fitness > selection_standard
      end
      strand_a = breeding_pair[0].strand
      strand_b = breeding_pair[1].strand

      new_generation += breed(strand_a, strand_b)

      breeding_pair = []
    end
    @strands = new_generation
  end

  # def pair_and_breed
  #   @strands.each_index do |i|
  #     if i.even?
  #       strand_a = @strands[i].strand
  #       strand_b = @strands[i+1].strand
  #       children = Breeder.slice_and_switch(strand_a, strand_b)
  #       @strands[i].strand, @strands[i+1].strand = children[0], children[1]
  #     end
  #   end
  # end

  def self.slice_and_switch(father, mother, crossover = rand(23)+1)
    father_tail = father.slice(crossover..-1)
    mother_tail = mother.slice(crossover..-1)
    father_head =  father.slice(0...crossover)
    mother_head = mother.slice(0...crossover)
    child1 = father_head + mother_tail
    child2 = mother_head + father_tail
    result = [child1, child2]
  end
end