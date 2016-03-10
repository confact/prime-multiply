# This class handle all the logic in the program.
# It use a addition to the Array class in array_addons
# to make it easier to understand the code.
class CalculatePrime

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
end
