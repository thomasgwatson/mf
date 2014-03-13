var arrayOfChars = ['a', 'b', 'c', 'd', 'e']

reverseChars = function(chars){
  front_pointer = 0
  end_pointer = chars.length-1
  counter = Math.floor((chars.length/2))
  while (counter > 0) {
    left = chars[front_pointer]
    right = chars[end_pointer]
    chars[front_pointer] = right
    chars[end_pointer] = left
    end_pointer--
    front_pointer++
    counter--
    console.log(chars)
    console.log(counter)
  }
  return chars
}

console.log(reverseChars(arrayOfChars))