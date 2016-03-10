# Multiply the primes
class MultiplyPrimes
  def initialize(primes)
    @primes = primes
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
    @counted
  end
end
