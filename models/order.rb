require 'pg'

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

  def save
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
    )"

    SqlRunner.run(sql)
  end


  def self.all()
    sql = "SELECT FROM orders;"

    orders = SqlRunner.run(sql)
    result = orders.map {|order| Order.new(order)}
    return result
  end

end