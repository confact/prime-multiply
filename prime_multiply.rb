# This program multiplies all primes and
# add them to a multidimensional array and
# present them as a table in the terminal
#
# Author: Håkan Nylén (mailto:hakan@dun.se)

require 'rubygems'
require 'bundler/setup'

require 'optparse'
require 'terminal-table'
require './lib/prime-multiply/array_addons'
require './lib/prime-multiply/calculate_prime'
require './lib/prime-multiply/Multiply_primes'
require './lib/prime-multiply/present_primes'

# Just parsing the options here and
# initialize the Calculater to present
# the table of results.

options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: prime_multiply.rb [options]'

  opts.on('-c', '--count N', Integer, 'Select amount of primes') do |v|
    options[:count] = v
  end
end.parse!
if options.include? :count
  table = nil
  primes = CalculatePrime.new
  primes = primes.get_prime_numbers(options[:count])
  multiply = MultiplyPrimes.new primes
  counted = multiply.multiply
  table = PresentPrimes.new primes, counted
  puts table.present
end
