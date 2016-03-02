require 'spec_helper'
describe CalculatePrime do
  describe '.new' do
    context 'check istance' do
      it 'returns terminal table' do
        prime = CalculatePrime.new(0)
        expect(prime.present).to be_a Terminal::Table
      end
    end

    context 'check variables' do
      it 'return empty array' do
        prime = CalculatePrime.new(0)
        expect(prime.primes).to eql([])
      end

      it 'return array with one empty string' do
        prime = CalculatePrime.new(0)
        prime.present # this adds a empty value in array due to unshift
        expect(prime.primes).to eql([''])
      end

      it 'return array with 2 primes' do
        prime = CalculatePrime.new(2)
        expect(prime.primes.size).to eql(2)
      end

      it 'return array 2 primes and empty string' do
        prime = CalculatePrime.new(2)
        prime.present # this adds a empty value in array due to unshift
        expect(prime.primes.size).to eql(3)
      end

      it 'return multidimensional array with primes' do
        prime = CalculatePrime.new(2)
        expect(prime.counted.size).to eql(2)
        expect(prime.counted.first.size).to eql(3)
      end
    end

    context 'get table' do
      it 'return asci table of primes' do
        prime = CalculatePrime.new(2)
        expect(prime.present.render).to eql(<<-EOF.deindent
+---+---+---+
|   | 2 | 3 |
+---+---+---+
| 2 | 4 | 6 |
| 3 | 6 | 9 |
+---+---+---+
EOF
                                           )
      end
    end
  end
end
