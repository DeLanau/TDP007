require 'date'

'''Uppgift 1'''

# Iterator-funktion som anropar givet block n gånger. 
def n_times(n, &block)
    n.times do
        block.call()
    end
end

# Iterator-klass som instansieras med ett tal.
class Repeat
    def initialize(n)
        @n = n
    end
    # Metoden each som tar ett block och anropar antal gånger som angavs när objektet skapades.
    def each(&block)
        @n.times do
            block.call()
        end
    end
end


n_times(3) { puts "Hello!" }
do_three = Repeat.new(3)
do_three.each { puts "Horray!" }

''' Uppgift 2 '''

# Factorial är en funktion som beräknar fakutleten av ett positivt tal.
def factorial(n)
    (1..n).inject(:*)
end

p factorial(0)

''' Uppgift 3 '''

# Max_by returnerar objektet med maximal värde från angiven block.
def longest_string(ar)
    p ar.max_by{|obj|obj.length} 
end

longest_string ["apelsin", "banan", "citron"]


''' Uppgift 5 '''

class PersonName
    def initialize(name, surname)
        @name = name
        @surname = surname
    end
    def get_fullname()
        return @name + ' ' + @surname
    end
    def set_fullname(new_name)
        @name = new_name.split[0]
        @surname = new_name.split[1]
    end
end

person = PersonName.new("Lasse", "Maja")
p person.get_fullname()
person.set_fullname("Claes Ohlson")
p person.get_fullname()

''' Uppgift 6 '''

class Person < PersonName
    def initialize(name, surname, age)
        @age = age 
        @birthyear = DateTime.now - @age * 365
        super(name, surname)
    end
    def set_age(new_age)
        @age = new_age
        @birthyear = DateTime.now.year - @age
    end
    def set_birthyear(new_by)
        @birthyear = new_by
        @age = DateTime.now.year - @birthyear
    end
end

new_person = Person.new("Hej", "svej", 20)
new_person.set_age(25)
p new_person
new_person.set_birthyear(2000)
p new_person


''' Uppgift 7 '''

class Integer 
    def self.fib(n)
        return n if n <= 1
        fib(n - 1) + fib(n - 2)
    end
end

p Integer.fib(5)

''' Uppgift 8 '''

class String
    def acronym()
        res = []
        ar = self.split(' ')
        for x in ar
            res.append(x[0].capitalize)
        end
        return res.join
    end
end

"Laugh out loud".acronym

''' Uppgift 10 '''

def find_username(str)
    if str[/:\s*([a-zA-Z]{1,})/] != nil
        return str.scan(/:\s*([a-zA-Z]{1,})/).join
    else
        return false
    end
end

p find_username("USERNAME: Brian")

''' Uppgift 12 '''

def regnr(str)
    if str[/[A-HJ-PR-UW-Z]{3}[0-9]{3}/] != nil
        return str[/[A-HJ-PR-UW-Z]{3}[0-9]{3}/]
    else
        return false
    end
end

regnr("Min bil heter FMA297.")
regnr("XQT784")