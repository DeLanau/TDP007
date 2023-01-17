require 'date'

'''Uppgift 1'''
# Denna uppgift testas inte eftersom den gjordes extra utöver det obligatoriska antalet uppgifter som krävdes.
# Iterator-funktion som anropar givet block n gånger. 
def n_times(n)
    n.times do 
        yield
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

''' Uppgift 2 '''

# Factorial är en funktion som beräknar fakutleten av ett positivt tal.
def factorial(n)
    (1..n).inject(:*)
end

''' Uppgift 3 '''

# Max_by returnerar objektet med maximal värde från angiven block.
def longest_string(ar)
    p ar.max_by{|obj|obj.length} 
end

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

''' Uppgift 6 '''

class Person < PersonName
    def initialize(name, surname, age)
        @age = age 
        @birthyear = DateTime.now.year - @age
        super(name, surname)
    end

    def get_age()
        return @age
    end

    def get_birthyear()
        return @birthyear
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

''' Uppgift 7 '''

class Integer 
    def self.fib(n)
        return n if n <= 1
        fib(n - 1) + fib(n - 2)
    end
end

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

''' Uppgift 10 '''

def find_username(str)
    if str[/:\s*([a-zA-Z]{1,})/] != nil
        return str.scan(/:\s*([a-zA-Z]{1,})/).join
    else
        return false
    end
end

''' Uppgift 12 '''

def regnr(str)
    if str[/[A-HJ-PR-UW-Z]{3}[0-9]{3}/] != nil
        return str[/[A-HJ-PR-UW-Z]{3}[0-9]{3}/]
    else
        return false
    end
end