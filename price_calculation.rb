require './models/campaign.rb'
require './models/order.rb'

# 計算規則
#
# 1. 消費未滿 $1,500, 則須增加 $60 運費
# 2. 若消費期間有超過兩個優惠活動，取最優者折扣 
# 3. 運費計算在優惠折抵之後
#
# Please implemenet the following methods.
# Additional helper methods are recommended.

class PriceCalculation
  def initialize(order_id)
    @order = verify(order_id)
  end

  def campaign
    @best_discount = Campaign.running_campaigns(@order.order_date).map(&:discount_ratio).max
  end

  def total
    if campaign
      @discount_price = @order.price * ((100 - @best_discount )/ 100.0)
    else
      @discount_price = @order.price
    end

    (free_shipment?)? @discount_price : @discount_price += 60
  end

  def free_shipment?
    @order.price > 1500
  end

  private

  def verify(order_id)
    order = Order.find(order_id)
    return order if order
    raise Order::NotFound
  end

end
