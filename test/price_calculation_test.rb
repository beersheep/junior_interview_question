require 'minitest/autorun'
require './price_calculation.rb'

class PriceCalculationTest < Minitest::Test
  def test_raise_error_if_no_order_found
    assert_raises(Order::NotFound) { PriceCalculation.new('AB1234') }
  end

  def test_is_free_shipment
    order = PriceCalculation.new('OB9800')

    assert order.free_shipment?
  end

  def test_is_free_shipment
    order = PriceCalculation.new('OB2300')

    assert_equal false, order.free_shipment?
  end

  def test_shipment_fee_being_added_to_the_total_price
    # price: 980, no campaign
    order = PriceCalculation.new('OB2300')

    assert_equal(1040, order.total)
  end

  def test_the_order_has_free_shipment
    # price: 1600, no campaign
    order= PriceCalculation.new('OB9800')

    assert_equal(1600, order.total)
  end

  def test_the_order_has_a_campaign
    # price: 780, discount_ratio: 15
    order = PriceCalculation.new('OC2233')

    assert_equal(723, order.total)
  end

  def test_the_order_has_more_than_one_campaign
    # price: 1000, discount_ratio: 15 and 20
    # should apply 20%
    order = PriceCalculation.new('AE4123')

    assert_equal(860, order.total)
  end
end
