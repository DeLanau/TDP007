require "./constraint_networks"
require "test/unit"

class MyTest < Test::Unit::TestCase

  def test

    a = Connector.new("a")
    b = Connector.new("b")
    c = Connector.new("c")
    Adder.new(a, b, c)
    a.user_assign(10)
    b.user_assign(5)
    puts "c = "+c.value.to_s
    a.forget_value "user"
    c.user_assign(20)
    # a should now be 15
    puts "a = "+a.value.to_s
    
    assert_equal(15, a.value)
  end

end
