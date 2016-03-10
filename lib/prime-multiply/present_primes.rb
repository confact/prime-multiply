class PresentPrimes
  def initialize(primes, counted)
    @primes = primes
    @counted = counted
  end

  # return the data that was multiplied in a table
  def present
    # unshifting a empty string to make a empty column
    # between header and childcolumns
    Terminal::Table.new headings: @primes.unshift(''), rows: @counted
  end
end
