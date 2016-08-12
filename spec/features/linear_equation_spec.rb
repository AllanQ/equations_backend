require_relative '../../lib/linear_equation'

describe LinearEquation do
  describe '#result' do
    context 'with valid params' do
      it '3 params' do
        equation_params = {"a"=>"1", "b"=>"5", "c"=>"4"}

        expect(LinearEquation.new(equation_params).result).to eq(-5.0)
      end
      it 'c undefined' do
        equation_params = {"a"=>"2", "b"=>"-4", "c"=>""}

        expect(LinearEquation.new(equation_params).result).to eq(2)
      end
    end
    context 'with invalid params' do
      it 'b undefined' do
        equation_params = {"a"=>"2", "b"=>"", "c"=>"5"}

        expect(LinearEquation.new(equation_params).result)
          .to eq('Param error! b undefined')
      end
      it 'a undefined' do
        equation_params = {"a"=>"", "b"=>"5", "c"=>"7"}

        expect(LinearEquation.new(equation_params).result)
          .to eq('Param error! a = 0 or undefined')
      end
      it 'a = 0' do
        equation_params = {"a"=>"0", "b"=>"5", "c"=>"10"}

        expect(LinearEquation.new(equation_params).result)
          .to eq('Param error! a = 0 or undefined')
      end
      it 'a is letter' do
        equation_params = {"a"=>"one", "b"=>"5", "c"=>"10"}

        expect(LinearEquation.new(equation_params).result)
          .to eq('Wrong format a param')
      end
      it 'b is letter' do
        equation_params = {"a"=>"1", "b"=>"two", "c"=>"10"}

        expect(LinearEquation.new(equation_params).result)
          .to eq('Wrong format b param')
      end
    end
  end
end
