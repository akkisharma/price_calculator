require('./logger')
require('./week_price')

module ReadInput

  # read user's item list
  def self.read_item_list

    week_price = WeekPrice.get_week_price

    puts 'Please enter all the items purchased separated by a comma:'
    item_list = gets.chomp.split(',').map{ |item| item.strip.downcase }

    Logger.info({item_list: item_list})

    # remove item not present in store
    item_not_present = item_list - week_price.map{ |item| item[:item] }
    item_list.reject!{ |item| item_not_present.include?(item) }

    items_by_count = item_list.group_by{|e| e}.map{|k, v| [k, v.length]}.to_h
    Logger.info({items_by_count: items_by_count})

    items_by_count.freeze
  end

end