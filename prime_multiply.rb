require 'rubygems'
require 'bundler/setup'

require 'optparse'
require './calculate_prime'

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
    primes = CalculatePrime.new(options[:count])
    puts primes.present
end
