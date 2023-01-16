
# Iterator-funktion som anropar givet block n gånger. 
def n_times(n, &block)
    for _ in 1..n 
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
        for _ in 1..@n
            block.call()
        end
    end
end


n_times(3) { puts "Hello!" }
do_three = Repeat.new(3)
# Skriver ut instansen av Repeat med @n=3
p do_three
do_three.each { puts "Horray!" }