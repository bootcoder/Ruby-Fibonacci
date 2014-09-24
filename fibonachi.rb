##########################
# RUBY FIBONACHI NUMBERS #
##########################
### Hunter T. Chapman  ###
## bootcoder@gmail.com  ##
##########################

require 'awesome_print'

##########################
# 			PSEUDO CODE
##########################

=begin

Example Fibonachi Render
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


def print_fibinachi(num)
	fib_container = [1,1]
	(num-2).times { fib_container << fib_container[-2] + fib_container.last }
	fib_container
end

def recursive_fibonachi(num, fib_container = [1,1])
	fib_container << fib_container[-2] + fib_container.last
	num -= 1
	recursive_fibonachi(num, fib_container) unless num == 2
	fib_container
end

ap recursive_fibonachi(12)

# ap print_fibinachi(300)