require 'terminal-table'
require 'optparse'
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

  FIXNUM_MAX = (2**(0.size * 8 - 2) - 1)

  # initialize the class and create number of primes picked
  def initialize(count)
    @primes = get_prime_numbers(count)
    multiply
  end

  # gets amount of primes from Prime class
  def get_prime_numbers(size)
    primes = []
    return [] if size < 1
    (2..FIXNUM_MAX).each do |num|
      # want to break it when got all asked primes so it will
      # not go for infinite
      break if primes.size >= size
      # check if num is odd by dividenum and add it
      primes.push(num) if (2..num - 1).all? { |dividenum| num % dividenum > 0 }
    end
    primes
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
