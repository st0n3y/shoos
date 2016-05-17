require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/order.rb'

class TestOrder < MiniTest::Test

  def setup()
    options = {
      'first_name' => 'Stoney',
      'last_name' => 'Brae',
      'quantity' => 1,
      'size' => 11
    }

    @order = Order.new(options)
  end

  def test_first_name()
    assert_equal('Stoney', @order.first_name)
  end

  def test_last_name()
    assert_equal('Brae', @order.last_name)
  end

  def test_concat_name()
    assert_equal('Stoney Brae', @order.concat_name)
  end

  def test_quantity()
    assert_equal(Fixnum, @order.quantity.class)
    assert_equal(1, @order.quantity)
  end

  def test_size()
    assert_equal(Fixnum, @order.size.class)
    assert_equal(11, @order.size)
  end

end