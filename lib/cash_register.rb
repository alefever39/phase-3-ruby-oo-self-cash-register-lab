require "pry"
class CashRegister
  attr_accessor :discount, :total
  attr_writer :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def apply_discount
    if @discount > 0
      self.total = @total.to_f - (@total.to_f * (@discount.to_f / 100.to_f))
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def add_item(title, price, quantity = 1)
    self.total = @total + price * quantity
    self.items = @items + [title] * quantity
    @previous_item = [price, quantity]
  end

  def items
    @items
  end

  def void_last_transaction
    self.items = @items.slice!(@items.size - @previous_item[1], @items.size)
    self.total = @total - @previous_item[0] * @previous_item[1]
  end
end
