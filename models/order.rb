require 'pg'
require_relative '../db/sql_runner.rb'

class Order

  attr_reader :first_name, :last_name, :quantity, :size

  def initialize(options)
    @first_name = options['first_name']
    @last_name = options['last_name']
    @quantity = options['quantity'].to_i
    @size = options['size'].to_i
  end

  def concat_name()
    return @first_name + " " + @last_name
  end

  def save()
    sql = "INSERT INTO orders(
      first_name
      last_name
      quantity
      size
    )
    VALUES (
      '#{@first_name}',
      '#{@last_name}',
      #{@quantity},
      #{@size}
    ) RETURNING *;"

    return Order.map_item( sql )
  end

  def self.map_items( sql )
      orders = SqlRunner.run( sql )
      result = orders.map { |order| Order.new( order ) }
      
      return result
    end

    def self.map_item( sql )
      result = Order.map_items( sql )
      
      return result.first
    end

  def self.all()
    sql = "SELECT * FROM orders;"

    orders = SqlRunner.run(sql)
    result = orders.map {|order| Order.new(order)}
    return result
  end

end