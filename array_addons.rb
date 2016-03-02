# This class just add a collect method for multiply_by
# to make it easier to understand the code.
class Array
  def multiply_by(x)
    collect { |n| n * x }
  end
end
