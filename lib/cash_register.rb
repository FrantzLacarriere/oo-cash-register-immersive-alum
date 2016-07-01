class CashRegister
  attr_accessor :total, :discount, :items

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = nil
  end

  def add_item(title, price, quantity = nil)

    item_tracker(title, quantity)
    @total += quantity ? price * quantity : price
    @last_transaction = quantity ? price * quantity : price
  end

  def item_tracker(title, quantity)
    if (quantity)
      i = 0
      while (i < quantity)
        @items << title
        i += 1
      end
    else
      @items << title
    end
  end

  def apply_discount
    if (@discount)
      @total -= (@total * discount) / 100
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end
