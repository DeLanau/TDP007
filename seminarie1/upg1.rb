
def n_times(n, &block)
    for _ in 1..n 
        block.call()
    end
end



n_times(3) { puts "Hello!" }
