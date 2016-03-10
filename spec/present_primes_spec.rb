require 'spec_helper'
describe PresentPrimes do
  describe '.new' do
    context 'get table' do
      it 'return asci table of primes' do
        prime = PresentPrimes.new([2, 3], [[2, 4, 6], [3, 6, 9]])
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
