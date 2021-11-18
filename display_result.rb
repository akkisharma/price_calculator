require('./logger')

module DisplayResult

  def self.show_result(items_by_price)

    # print table
    header = "\nItem     Quantity   Price \n---------------------------"
    puts header if items_by_price.any?
    Logger.info(header)
    items_by_price.each do |item|
      row = "#{item[:item]}      #{item[:quantity]}     #{item[:discount_price]}"
      puts row
      Logger.info(row)
    end

    if items_by_price.any?
      total_price = items_by_price.sum{ |item| item[:price] }
      total_discount_price = items_by_price.sum{ |item| item[:discount_price] }

      result_str = "\nTotal price : $#{total_discount_price.round(2)}"
      puts result_str
      Logger.info(result_str)

      result_str = "You saved $#{(total_price - total_discount_price).round(2)} today."
      puts result_str
      Logger.info(result_str)
    else
      puts "\nPlease enter some items!!"
    end

  end

end