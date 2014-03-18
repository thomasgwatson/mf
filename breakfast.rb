class Breakfast
  attr_reader :food
  attr_accessor :time
  def initialize(args={})
    @food = args[:food] || {}
    @time = args[:time] || 0
  end

  def eat_breakfast
    if @time > 60 && @food[:porridge] > 0
       make(:porridge)
    elsif @time > 20 && @food[:bagels] > 0
       make(:bagels)
    else
      "Tom is starving :("
    end
  end

  def make(food)
    @food[food] -= 1
    return "Delicious #{food} consumed!"
  end
end