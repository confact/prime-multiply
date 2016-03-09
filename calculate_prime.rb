require 'terminal-table'
require './array_addons'

# This program multiplies all primes and
# add them to a multidimensional array and
# present them as a table in the terminal
#
# Author: Håkan Nylén (mailto:hakan@dun.se)

# This class handle all the logic in the program.
# It use a addition to the Array class in array_addons
# to make it easier to understand the code.
class CalculatePrime
  attr_reader :primes, :counted

  # initialize the class and create number of primes picked
  def initialize(count)
    @primes = get_prime_numbers(count)
    multiply
  end

  # calculate primes within amount^2 and return the amount of primes as asked
  def get_prime_numbers(amount)
    primes = []
    # return empty array if requesting less than 1 primes.
    return [] if amount < 1
    # get amount of numbers to check by doing ldexp on amount and 2
    size = Math.ldexp(amount, 2)
    # fixing the numbers in the array with i+2
    for i in 0..size-2
     primes[i] = i+2
    end

    index = 0
    # keep loop alive if sqrt of primes.last.ceil is higher or equals to primes[index]
    while Math.sqrt(primes.last).ceil >= primes[index]
        (primes[index] * 2).step(primes.last, primes[index]) do
          |x|
          # delete number if not prime
          primes.delete(x)
        end
        index += 1
    end
    # return amount of primes requested
    primes.first(amount)
  end

  # multiply the primes with it's values with
  # the multiply_by method in my own array addition.
  def multiply
    @counted = []

    @primes.each do |n|
      # using unshift to add a extra of n to the beginning
      # of the array to show it nice in the table later
      @counted.push(@primes.multiply_by(n).unshift(n))
    end
  end

  # return the data that was multiplied in a table
  def present
    # unshifting a empty string to make a empty column
    # between header and childcolumns
    table = Terminal::Table.new headings: @primes.unshift(''), rows: @counted
    table
  end
end
