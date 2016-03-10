require 'spec_helper'
describe CalculatePrime do
  describe '.new' do
    context 'getting prime numbers' do
      it 'returning prime numbers in array' do
        prime = CalculatePrime.new
        prime = prime.get_prime_numbers(2)
        expect(prime).to be_a Array
      end

      it 'returning prime 2 numbers in array' do
        prime = CalculatePrime.new
        prime = prime.get_prime_numbers(2)
        expect(prime.size).to eql(2)
      end
    end
  end
end
