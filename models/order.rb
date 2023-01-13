class Order
  class NotFound < StandardError; end

  attr_reader :id, :price, :order_date

  def initialize(**attrs)
    attrs.each do |(k, v)|
      self.send(:"#{k}=", v)
    end
  end

  def self.find(id)
    orders.find do |order|
      id == order.id
    end
  end

  private_class_method :new

  private

  attr_writer :id, :price, :order_date

  def self.orders
    [
      new(id: 'AE4123', price: 1000, order_date: Time.new(2023, 1, 8)),
      new(id: 'OB9800', price: 1600, order_date: Time.new(2022, 12, 30)),
      new(id: 'OB2300', price: 980, order_date: Time.new(2022, 12, 30)),
      new(id: 'OC2233', price: 780, order_date: Time.new(2023, 1, 1))
    ]
  end
end
