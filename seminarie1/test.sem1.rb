require './sem1'
require 'test/unit'


class MyTest < Test::Unit::TestCase
  
  def test_2
    assert_equal(nil, factorial(0))
    assert_equal(1, factorial(1))
    assert_equal(2, factorial(2))
    assert_equal(6, factorial(3))
  end

  def test_3
    str = ["apelsin", "banan", "citron"]
    ar = ["apelsin", "banan", "citron", "granatäpple"]
    ar2 = []
    assert_equal("apelsin", longest_string(str))
    assert_equal("granatäpple", longest_string(ar))
    assert_equal(nil, longest_string(ar2))
  end

  def test_5
    person = PersonName.new("Lasse", "Maja")
    assert_equal("Lasse Maja", person.get_fullname())
    person.set_fullname("Hej Svej")
    assert_equal("Hej Svej", person.get_fullname())
  end

  def test_6
    person = Person.new("Lasse", "Maja", 20)    
    person.set_age(25)
    assert_equal(25, person.get_age())
    assert_equal(1998, person.get_birthyear())
    person.set_birthyear(2000)
    assert_equal(2000, person.get_birthyear())
    assert_equal(23, person.get_age())
  end

  def test_7
    assert_equal(0, Integer.fib(0))
    assert_equal(1, Integer.fib(1))
    assert_equal(5, Integer.fib(5))
    assert_equal(610, Integer.fib(15))
  end

  def test_8
    assert_equal("LOL", "laugh out loud".acronym)
    assert_equal("IDK", "I don't know!!!".acronym)
    assert_equal("#DK", "#I don't know!!!".acronym)
  end

  def test_10
    assert_equal("Brian", find_username("USERNAME: Brian"))
    assert_equal(false, find_username("USERNAME:"))
  end

  def test_12
    assert_equal("FMA297", regnr("Regnr är FMA297"))
    assert_equal(false, regnr("Regnr är QIV297"))
    assert_equal(false, regnr("Regnr är QIE297"))
    assert_equal(false, regnr("Regnr är QAE297"))
    assert_equal(false, regnr("Regnr är BAEC97"))
    assert_equal(false, regnr("Regnr är BAECR7"))
  end
end

