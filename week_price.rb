module WeekPrice

  WEEK_PRICING_DETAILS = [
    {
      item: 'milk',
      unit_price: 3.97,
      sale_quantity: 2,
      sale_price: 5.00,
    },
    {
      item: 'bread',
      unit_price: 2.17,
      sale_quantity: 3,
      sale_price: 6.00,
    },
    {
      item: 'banana',
      unit_price: 0.99
    },
    {
      item: 'apple',
      unit_price: 0.89
    }
  ].freeze

  def self.get_week_price
    WEEK_PRICING_DETAILS
  end

end