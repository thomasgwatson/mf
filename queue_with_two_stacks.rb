class Queue
  def initialize
    @in = []
    @out = []
  end

  def return_queue
    return [@in, @out]
  end

  def enqueue(value)
    @in.push(value)
  end

  def dequeue
    if @out.empty?
      self.empty_in_stack
      @out.pop
    else
      @out.pop
    end
  end

  def empty_in_stack
    @in.length.times do
      @out.push(@in.pop)
    end
  end
end

test_queue = Queue.new

for i in (1..7) do
  test_queue.enqueue(i)
end

p 'yay' if test_queue.return_queue == [[1,2,3,4,5,6,7], []]
p "works in this instance" if test_queue.dequeue == 1
test_queue.dequeue
test_queue.dequeue
p test_queue.return_queue
test_queue.enqueue(8)
p test_queue.return_queue