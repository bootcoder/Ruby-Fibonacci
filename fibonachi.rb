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


def iterative_fibinacci(num)
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

# write a function which takes a number and generates 
# Fibonacci's until it surpasses it then returns true if the number is in sequence.

def is_fibonacci(num)
	fib_container = [1,1]
	until fib_container.last >= num
		fib_container << fib_container[-2] + fib_container.last 
	end
	result = [num, (num == fib_container.last)]
end
# puts "The number: #{num}, is a Fibonacci Sequenced Number." if fib_container.last == num
# 	puts "The number: #{num}, is not a Fibonacci Sequenced Number." if fib_container.last != num


##########################
# 			Controller 
##########################

def runFIBapp
	greeting
	list_commands

end

def greeting
	puts "--Fibonacci Command Console--"
end

def list_commands
	user_input
end

def user_input
	print "->"
	input = gets.chomp
	ap input
end


runFIBapp



##########################
# 			TEST CODE
##########################

ap recursive_fibonacci(300) == 222232244629420445529739893461909967206666939096499764990979600

ap iterative_fibinacci(300) == 222232244629420445529739893461909967206666939096499764990979600

ap is_fibonacci(143)[1] == false
ap is_fibonacci(144)[1] == true