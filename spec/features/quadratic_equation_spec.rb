require_relative '../../lib/quadratic_equation'

describe QuadraticEquation do
  describe '#discriminant' do
    it 'compute discriminant' do
      equation_params = {"a"=>"5", "b"=>"6", "c"=>"7"}

      expect(QuadraticEquation.new(equation_params).discriminant)
        .to eq(6**2-4*5*7)
    end
  end
  describe '#result' do
    context 'with valid params' do
      it 'return two roots' do
        equation_params = {"a"=>"1", "b"=>"5", "c"=>"4"}

        expect(QuadraticEquation.new(equation_params).result).to eq([-1.0,-4.0])
      end
      it 'return one root' do
        equation_params = {"a"=>"3", "b"=>"-6", "c"=>"3"}

        expect(QuadraticEquation.new(equation_params).result)
          .to eq([1])
      end
      it 'no roots' do
        equation_params = {"a"=>"9", "b"=>"6", "c"=>"3"}

        expect(QuadraticEquation.new(equation_params).result)
          .to eq(['No any rational roots'])
      end
    end
    context 'with invalid params' do
      it 'a = 0' do
        equation_params = {"a"=>"0", "b"=>"6", "c"=>"3"}

        expect(QuadraticEquation.new(equation_params).result)
          .to eq(['Param error!! a = 0 or undefined'])
      end
      it 'a undefined' do
        equation_params = {"a"=>"", "b"=>"6", "c"=>"3"}

        expect(QuadraticEquation.new(equation_params).result)
          .to eq(['Param error!! a = 0 or undefined'])
      end
      it 'b undefined' do
        equation_params = {"a"=>"1", "b"=>"", "c"=>"3"}

        expect(QuadraticEquation.new(equation_params).result)
          .to eq(['Param error!! b undefined'])
      end
      it 'c undefined' do
        equation_params = {"a"=>"1", "b"=>"2", "c"=>""}

        expect(QuadraticEquation.new(equation_params).result)
          .to eq(['Param error!! c undefined'])
      end
      it 'a is letter' do
        equation_params = {"a"=>"one", "b"=>"5", "c"=>"10"}

        expect(QuadraticEquation.new(equation_params).result)
          .to eq(['Wrong format a param'])
      end
      it 'b is letter' do
        equation_params = {"a"=>"1", "b"=>"two", "c"=>"10"}

        expect(QuadraticEquation.new(equation_params).result)
          .to eq(['Wrong format b param'])
      end
      it 'c is letter' do
        equation_params = {"a"=>"1", "b"=>"2", "c"=>"three"}

        expect(QuadraticEquation.new(equation_params).result)
          .to eq(['Wrong format c param'])
      end
    end
  end
end
