class Queue
  def initialize
    @in = []
    @out = []
    @mode = "in"
  end

  def return_queue
    return @in if @mode == 'in'
    return @out if @mode == 'out'
  end

  def enqueue(value)
    self.switch_stacks if @mode == 'out'
    @in.push(value)
  end

  def dequeue
    # @out.pop if @out
    self.switch_stacks if @mode == "in"
    @out.pop
  end

  def switch_stacks
    if @mode == "in"
      @in.length.times do
        @out.push(@in.pop)
      end
      @mode = "out"
    else
      @out.length.times do
        @in.push(@out.pop)
      end
      @mode = "in"
    end
  end
end

test_queue = Queue.new

for i in (1..7) do
  test_queue.enqueue(i)
end

p 'yay' if test_queue.return_queue == [1,2,3,4,5,6,7]
p "works in this instance" if test_queue.dequeue == 1
p 'woo' if test_queue.enqueue(8) == [2,3,4,5,6,7,8]
test_queue.dequeue
test_queue.dequeue
p test_queue.return_queue
test_queue.enqueue(9)
p test_queue.return_queue