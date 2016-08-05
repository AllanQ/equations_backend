require_relative '../../lib/equation_solution'

describe EquationSolution do
  context 'valid data' do
    context 'linear' do
      it 'c = nil' do
        payload = {"type"=>"linear", "a"=>"2", "b"=>"6", "c"=>nil}

        expect(EquationSolution.new(payload).result).to eq([-3.0])
      end
      it 'c = 9' do
        payload = {"type"=>"linear", "a"=>"-1", "b"=>"4", "c"=>"9"}

        expect(EquationSolution.new(payload).result).to eq([4.0])
      end
      it 'b = 0' do
        payload = {"type"=>"linear", "a"=>"2", "b"=>"0", "c"=>nil}

        expect(EquationSolution.new(payload).result).to eq([0])
      end
    end
    context 'quadratic' do
      it '2 roots' do
        payload = {"type"=>"quadratic", "a"=>"1", "b"=>"4", "c"=>"3"}

        expect(EquationSolution.new(payload).result).to eq([-1.0, -3.0])
      end
      it '1 root' do
        payload = {"type"=>"quadratic", "a"=>"1", "b"=>"4", "c"=>"4"}

        expect(EquationSolution.new(payload).result).to eq([-2])
      end
      it 'there are not any roots' do
        payload = {"type"=>"quadratic", "a"=>"1", "b"=>"2", "c"=>"3"}

        expect(EquationSolution.new(payload).result).to eq(['The are not any rational roots'])
      end
    end
  end
  context 'invalid data' do
    context 'linear' do
      it 'a = nil' do
        payload = {"type"=>"linear", "a"=>nil, "b"=>"6", "c"=>"10"}

        expect(EquationSolution.new(payload).result).to eq(['There is param error! a = 0 or undefined'])
      end
      it 'a = 0' do
        payload = {"type"=>"linear", "a"=>"0", "b"=>"6", "c"=>nil}

        expect(EquationSolution.new(payload).result).to eq(['There is param error! a = 0 or undefined'])
      end
      it 'b = nil' do
        payload = {"type"=>"linear", "a"=>"5", "b"=>nil, "c"=>"5"}

        expect(EquationSolution.new(payload).result).to eq(['There is param error! b undefined'])
      end
    end
    context 'quadratic' do
      it 'a = nil' do
        payload = {"type"=>"quadratic", "a"=>nil, "b"=>"4", "c"=>"3"}

        expect(EquationSolution.new(payload).result).to eq(['There is param error!! a = 0 or undefined'])
      end
      it 'a = 0' do
        payload = {"type"=>"quadratic", "a"=>"0", "b"=>"4", "c"=>"3"}

        expect(EquationSolution.new(payload).result).to eq(['There is param error!! a = 0 or undefined'])
      end
      it 'b = nil' do
        payload = {"type"=>"quadratic", "a"=>"1", "b"=>nil, "c"=>"3"}

        expect(EquationSolution.new(payload).result).to eq(['There is param error!! b undefined'])
      end
      it 'c = nil' do
        payload = {"type"=>"quadratic", "a"=>"1", "b"=>"4", "c"=>nil}

        expect(EquationSolution.new(payload).result).to eq(['There is param error!! c undefined'])
      end
    end
    it 'type = cubic' do
      payload = {"type"=>"cubic", "a"=>"1", "b"=>"4", "c"=>"3"}

      expect(EquationSolution.new(payload).result).to eq(['Type equation error'])
    end
  end
end
