require './sem1'
require 'test/unit'


class MyTest < Test::Unit::TestCase
  # def setup
  # end

  # def teardown
  # end

#   def test_1
#     assert("Hello!", n_times(3) {puts "Hello!"})
#   end
  def test_2
    assert_same(nil, factorial(0))
    assert_same(1, factorial(1))
    assert_same(2, factorial(2))
    assert_same(6, factorial(3))
  end
end