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
      number = args[0]
      operator_and_friends = args[1]
      current_sequence = Sequence.new(number, operator_and_friends)
      puts current_sequence.split_the_number
    end
  end
end

class Sequence
  def initialize(number, operator_and_friends)
    find_operator_in_string(operator_and_friends)
    @number = number
  end

  def find_operator_in_string(operator_and_friends)
    @operator = /[\+-]/.match(operator_and_friends)[0]
    @index_of_operation = operator_and_friends.rindex(@operator)
  end

  def split_the_number
    tail = @number[@index_of_operation..-1].to_i
    head = @number[0...@index_of_operation].to_i
    return tail + head if @operator == '+'
    return head - tail if @operator == '-'
  end
end

InputParser.new