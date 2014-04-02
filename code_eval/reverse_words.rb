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
      puts Reverse_order.reverse_array(args)
    end
  end
end

class Reverse_order
  def self.reverse_array(array_to_reverse)
    array_to_reverse.reverse!.join(' ')
  end
end

InputParser.new