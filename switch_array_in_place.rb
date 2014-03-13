# Write a function to reverse an array of characters in place.
# "In place" means "without creating a new string in memory."

array_of_chars = ["a", "b", "c", "d", "e"]

def reverse_char(string)
  operations = string.length/2
  end_of_array = -1
  for i in (0...operations)
    string[i], string[end_of_array] = string[end_of_array], string[i]
    end_of_array -= 1
  end
  string
end

p reverse_char(array_of_chars)