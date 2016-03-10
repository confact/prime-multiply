require 'rubygems'
require 'bundler/setup'

require 'benchmark'
require 'optparse'
require 'terminal-table'
require './lib/prime-multiply/array_addons'
require './lib/prime-multiply/calculate_prime'
require './lib/prime-multiply/Multiply_primes'
require './lib/prime-multiply/present_primes'
# borrowed from terminal-table
class String
  def deindent
    strip.gsub(/^ */, '')
  end
end
