##########################
# RUBY FIBONACCI NUMBERS #
##########################
### Hunter T. Chapman  ###
## bootcoder@gmail.com  ##
##########################

require 'awesome_print'
require 'benchmark'

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


##########################
# 				Model 
##########################


def iterative_fibinacci(num)
	fib_container = [1,1]
	(num-2).times { fib_container << fib_container[-2] + fib_container.last }
	fib_container
end


def recursive_fibonacci(num, fib_container = [1,1])
	fib_container << fib_container[-2] + fib_container.last
	num -= 1
	recursive_fibonacci(num, fib_container) unless num == 2
	fib_container
end



# write a function which takes a number and generates 
# Fibonacci's until it surpasses it then returns true if the number is in sequence.

def is_fibonacci(num)
	fib_container = [1,1]
	fib_counter = 2
	until fib_container.last >= num
		fib_container << fib_container[-2] + fib_container.last
		fib_counter += 1
	end
	result = [num, fib_container.last, (num == fib_container.last), fib_counter]
end




##########################
# 			Controller 
##########################

def runFIBapp
	system 'clear'
	list_commands
	list_command_controller
end


def list_command_controller
	input = user_input
	system 'clear'
	case input
	when 1
		choose_fib
	when 2
		check_fib
	end
end

def user_input
	print "->"
	input = gets.chomp
	terminate_program if input.downcase == "exit"
	if input.to_i == 0
		puts "Error:\tThis program accepts only numric input.\nPlease enter command number."
		user_input
	elsif input.to_i == 3
		terminate_program
	else 
		return input.to_i
	end
end

def choose_fib
	ask_sequence
	sequence = user_input
	ask_function
	func_type = user_input
	case func_type
	when 1
		result = iterative_fibinacci(sequence)
	when 2
		result = recursive_fibonacci(sequence)
	end
	print_sequence_result(result, sequence)
	prompt_continue
	runFIBapp
end

def check_fib
	ask_check_num
	check_num = user_input
	result = is_fibonacci(check_num)
	print_check_result(result)
	prompt_continue
	runFIBapp
end





##########################
# 				View 
##########################

def greeting
	system 'clear'
	puts
	puts "\t--Fibonacci Calculation Console--\n\t\tHunter T. Chapman\n\t\s\s\s\s\s\s\sBootCoder@gmail.com"
	puts 
end

def list_commands
	greeting
	puts "1. Find the number at a given position in Fibonacci sequence."
	puts "2. Check if a number is within the Fibonacci sequence"
	puts
	puts "3. Terminate Program :: Enter 'Exit'"
	puts
	puts "Input Command Number:"
end

def ask_sequence
	greeting
	puts "What position in the sequence please:"
end

def ask_function
	greeting
	puts "This program can solve the sequence using iterative or recursive functionality."
	puts
	puts "Choose Function Type:"
	puts "1. Iterative"
	puts "2. Recursive"
end

def ask_check_num
	greeting
	puts "Please enter a positive integer to check \nif it is within the Fibonacci sequence."
end

def print_sequence_result(result, sequence)
	greeting
	puts "You requested the number at position #{sequence} in the Fibonacci sequence."
	puts "The sequence is:"
	print result
	puts
	puts
	puts "Sequence position #{sequence}: = #{result.last}"
end

def print_check_result(result_arr)
	greeting
	puts "Checking Fibonacci Sequence for #{result_arr[0]}."
	puts
	puts
	if result_arr[2] == true
		puts "Success! The integer #{result_arr[1]} is a Fibonacci."
		puts
		puts "It is at position #{result_arr[3]} in the sequence."
	else
		puts "Sorry, #{result_arr[0]} is not in the sequence."
		puts "The closest integer is #{result_arr[1]}."
		puts "At position #{result_arr[3]}."
		bench()
	end
end


def prompt_continue
	puts
	puts "Hit Enter to Continue"
	gets.chomp
end

def terminate_program
	puts "Bye Bye Miss American Pie"
	exit
end




##########################
# 			APPLICATION
##########################
runFIBapp






##########################
# 			TEST CODE
##########################

# ap recursive_fibonacci(300).last == 222232244629420445529739893461909967206666939096499764990979600

# ap iterative_fibinacci(300).last == 222232244629420445529739893461909967206666939096499764990979600

# ap is_fibonacci(143)[2] == false
# ap is_fibonacci(144)[2] == true