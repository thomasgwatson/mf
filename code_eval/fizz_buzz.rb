class FizzBuzzer
  def initialize
    @file_lines = []
    read_file
    convert_args
    call_each_sequence
  end

  def read_file(filepath = ARGV[0])
    File.foreach("./#{filepath}") { |line|  @file_lines << line.chomp }
  end

  def convert_args
    @file_lines.map! do | arg_string |
      arg_string.split(" ")
    end
  end

  def call_each_sequence
    @file_lines.each do | args |
      fizz = args[0].to_i
      buzz = args[1].to_i
      length = args[2].to_i
      p fizzbuzz(fizz, buzz, length)
    end

  end

  def fizzbuzz(fizz, buzz, length)
    sequence_result = ""
    for value in (1..length)
      sequence_result += 'F' if value % fizz == 0
      sequence_result += 'B' if value % buzz == 0
      sequence_result += value.to_s if value % fizz != 0 && value % buzz != 0
      sequence_result += ' ' if value != length
    end
    sequence_result
  end
end

FizzBuzzer.new