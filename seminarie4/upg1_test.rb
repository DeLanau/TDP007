require "./constraint_networks"
require "test/unit"

class MyTest < Test::Unit::TestCase

  def test_1

    a = Connector.new("a")
    b = Connector.new("b")
    c = Connector.new("c")
    Adder.new(a, b, c)
    a.user_assign(10)
    b.user_assign(5)
    
    a.forget_value "user"
    c.user_assign(20)
    
    assert_equal(15, a.value)

    b.forget_value "user"

    a.user_assign(15)
    c.user_assign(20)
    
    assert_equal(5, b.value)
  end

  def test_2

    a = Connector.new("a")
    b = Connector.new("b")
    c = Connector.new("c")

    Multiplier.new(a,b,c)
    a.user_assign(10)
    b.user_assign(5)
    
    assert_equal(50, c.value)

    a.forget_value "user"
    c.user_assign(50)

    assert_equal(10, a.value)
    
  end 
  
end
