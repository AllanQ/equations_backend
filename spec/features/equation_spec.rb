require_relative '../../lib/equation'

describe String do
  describe '#to_f_if_numeric' do
    let(:equation) { Equation.new({"a"=>"1", "b"=>"5", "c"=>"4"}) }
    it 'number' do
      expect(equation.to_f_if_numeric('7')).to eq(7.0)
    end
    it 'empty string' do
      expect(equation.to_f_if_numeric('')).to eq('')
    end
    it 'space' do
      expect(equation.to_f_if_numeric(' ')).to eq(' ')
    end
    it 'word' do
      expect(equation.to_f_if_numeric('one')).to eq('one')
    end
    it 'nil' do
      expect(equation.to_f_if_numeric(nil)).to eq(nil)
    end
  end
end
