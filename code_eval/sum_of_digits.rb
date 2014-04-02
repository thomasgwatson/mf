class InputParser
  def initialize
    @file_lines = []
    read_file
    call_each_sequence
  end

  def read_file(filepath = ARGV[0])
    File.foreach(filepath) { |line|  @file_lines << line.chomp }
  end

  def call_each_sequence
    @file_lines.each do | string_of_digits |
      puts DigitSummer.sum_digits_in_string(string_of_digits)
    end
  end
end

class DigitSummer
  def self.sum_digits_in_string(string_of_digits)
    result = 0
    string_of_digits.each_char do |digit|
      result += digit.to_i
    end
    result
  end
end


InputParser.new