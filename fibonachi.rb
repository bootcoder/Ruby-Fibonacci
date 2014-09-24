##########################
# RUBY FIBONACCI NUMBERS #
##########################
### Hunter T. Chapman  ###
## bootcoder@gmail.com  ##
##########################

require 'awesome_print'

##########################
# 			PSEUDO CODE
##########################

=begin

Example Fibonacci Render
1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144



write a function that takes a single argument
the argument is an integer representing the depth of the sequence (num)
create a container array to place numbers in (fib_container)
set fib_container to an array containing two integers, 1 && 1

degrade num by two since you are seeding the first two numbers in the sequence

FOR LOOP counting from 0 to num
	push the sum of next last && last element into fib_container
END FOOR LOOP

fib_container print each value 

=end


def print_fibinacci(num)
	fib_container = [1,1]
	(num-2).times { fib_container << fib_container[-2] + fib_container.last }
	fib_container.last
end

def recursive_fibonacci(num, fib_container = [1,1])
	fib_container << fib_container[-2] + fib_container.last
	num -= 1
	recursive_fibonacci(num, fib_container) unless num == 2
	fib_container.last
end

ap recursive_fibonacci(300) #->222232244629420445529739893461909967206666939096499764990979600

ap print_fibinacci(300) #->222232244629420445529739893461909967206666939096499764990979600