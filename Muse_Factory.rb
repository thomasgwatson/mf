# 10,12,16,8,14,9,20,6,15

# max value
# min value
# profit = max - min
# index of max value
# index of min value

# buy before sell

# -For each value (x) in original stock price array:
#  Check all values following that value (x), comparing x to those following values
#   keep track of the greater positive difference
#   store in an array (called max_differences)
# -Find max value of max_differences array
#   Use that value against the array to find the index (y) of that value.
#   That index will be of the min value (in the biggest profit pairing) in the stock price array.
#   Grab the value at that index on the stock price array. Add the 'max value' to that value (sum being 'max_value_'. This will be the higher value from the biggest profit pairing.
# Checking only values after y index of the stock price array, match

class Stock_price
  attr_accessor :price_over_time
  def initialize(price_over_time)
    @price_over_time = price_over_time
  end

  def analyse
    min_value = { :price => @price_over_time[0], :time => 0 }
    results = { max_profit: 0, sell_day: 0, buy_day: 0 }
    for day in (0...@price_over_time.length) do
      p day
      current_price = @price_over_time[day]
      if current_price < min_value[:price]
        min_value[:time] = day
        min_value[:price] = current_price
      end
      if results[:max_profit] < current_price - min_value[:price]
        results[:sell_day] = min_value[:time]
        results[:buy_day] = day
        results[:max_profit] = current_price - min_value[:price]
      end
    end
    results
  end

end

price = [10,12,16,8,14,9,20,6,15]

company_A = Stock_price.new(price)
puts company_A.analyse