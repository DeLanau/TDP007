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

factorial(9)

''' Uppgift 3 '''

# Max_by returnerar objektet med maximal värde från angiven block.
def longest_string(ar)
    p ar.max_by{|obj|obj.length} 
end

longest_string ["apelsin", "banan", "citron"]

 ''' Uppgift 4 '''

# def find_it(ar, &block)
#     p ar.find{block}
# end

# find_it(["apelsin", "banan", "citron"]) { |a,b| a.length > b.length }

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

# class Person < PersonName
#     def initialize(name=super(name), surname=super(surname), age)
#         @age = age 
#         @birthyear = DateTime.now - @age * 365
#         super(name, surname)
#     end
# end

# personna = Person.new( 20)
# p personna

''' Uppgift 7 '''

