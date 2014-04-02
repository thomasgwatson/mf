class InputParser
  def initialize
    @file_lines = []
    read_file
    convert_args
    call_each_sequence
  end

  def read_file(filepath = ARGV[0])
    File.foreach(filepath) { |line|  @file_lines << line.chomp }
  end

  def convert_args
    @file_lines.map! do | arg_string |
      arg_string.split(" ")
    end
  end

  def call_each_sequence
    @file_lines.each do | args |
      puts LongestWordFinder.find_in_array(args)
    end
  end
end

class LongestWordFinder
  def self.find_in_array(array_of_words)
    longest_word_length = 0
    longest_word = ''
    array_of_words.each do |word|
      if word.length > longest_word_length
        longest_word_length = word.length
        longest_word = word
      end
    end
    longest_word
  end
end

InputParser.new