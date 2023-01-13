require './models/campaign.rb'
require './models/order.rb'

# 計算規則
#
# 1. 消費未滿 $1,500, 則須增加 $60 運費
# 2. 若消費期間有超過兩個優惠活動，取最優者折扣 
# 3. 運費計算在優惠折抵之後
#
# Please implmenet the following methods 
# Additional helper methods are recommended.

class PriceCalculation
  def initialize(order_id)
  end

  def total
  end

  def free_shipment?
  end
end
