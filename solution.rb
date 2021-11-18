require('./read_input')
require('./display_result')
require('./calculator_helper')
require('./logger')

class PriceCalculator

  # main method to perform all tasks
  def self.calculate

    begin
      # read user input
      items_by_count = ReadInput.read_item_list

      # calculate item list price
      items_by_price = CalculatorHelper.new({items_by_count: items_by_count}).calculate_price

      # display final item list price
      DisplayResult.show_result(items_by_price)

    rescue => error
      Logger.error(error)
      puts "error = #{error}: Backtrace: \n #{error.backtrace.join("\n")} "
    end

  end

end


PriceCalculator.calculate