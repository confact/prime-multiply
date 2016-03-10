require 'spec_helper'
describe MultiplyPrimes do
  describe '.new' do
    context 'multiply primes in array' do
      it 'return multidimensional array' do
        multiply = MultiplyPrimes.new([2, 3])
        expect(multiply.multiply).to eql([[2, 4, 6], [3, 6, 9]])
      end
    end
  end
end
