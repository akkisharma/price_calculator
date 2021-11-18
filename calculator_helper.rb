require('./week_price')

class CalculatorHelper

  def initialize(options)
    @items_by_count = options[:items_by_count]
    @week_price = WeekPrice.get_week_price
    @item_week_detail;
  end

  # create all items price
  def calculate_price

    items_by_price = []
    @items_by_count.each do |item, quantity|

      @item_week_detail = get_item_week_price(item)
      item_prices = get_item_prices(quantity)

      items_by_price << {
        item: item,
        quantity: quantity,
        price: item_prices[:total_price],
        discount_price: item_prices[:total_discount_price]
      }
    end

    items_by_price
  end

  private

  # get item price details
  def get_item_week_price(item)
    @week_price.find{|itm| itm[:item] == item}
  end

  # get total cost for all items
  def get_item_prices(quantity)

    total_price = total_discount_price = 0

    if @item_week_detail

      sale_qty = @item_week_detail[:sale_quantity]
      sale_price = @item_week_detail[:sale_price]
      unit_price = @item_week_detail[:unit_price]

      if sale_qty
        discount_price = (quantity / sale_qty) * sale_price
        unit_price = (quantity % sale_qty) * unit_price
        total_discount_price = discount_price + unit_price
        total_price = unit_price * quantity
      else
        total_price = total_discount_price = unit_price * quantity
      end

    end

    {total_price: total_price, total_discount_price: total_discount_price}.freeze
  end

end