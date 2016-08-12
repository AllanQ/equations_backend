require_relative '../../lib/equation_solution'

describe EquationSolution do
  describe '#result' do
    context 'with valid data' do
      context 'when linear' do
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
      context 'when quadratic' do
        it '2 roots' do
          payload = {"type"=>"quadratic", "a"=>"1", "b"=>"4", "c"=>"3"}

          expect(EquationSolution.new(payload).result).to eq([-1.0, -3.0])
        end
        it '1 root' do
          payload = {"type"=>"quadratic", "a"=>"1", "b"=>"4", "c"=>"4"}

          expect(EquationSolution.new(payload).result).to eq([-2])
        end
        it 'No any roots' do
          payload = {"type"=>"quadratic", "a"=>"1", "b"=>"2", "c"=>"3"}

          expect(EquationSolution.new(payload).result)
            .to eq(['No any rational roots'])
        end
      end
    end
    context 'with invalid data' do
      context 'when linear' do
        it 'a = nil' do
          payload = {"type"=>"linear", "a"=>nil, "b"=>"6", "c"=>"10"}

          expect(EquationSolution.new(payload).result)
            .to eq(['Param error! a = 0 or undefined'])
        end
        it 'a = 0' do
          payload = {"type"=>"linear", "a"=>"0", "b"=>"6", "c"=>nil}

          expect(EquationSolution.new(payload).result)
            .to eq(['Param error! a = 0 or undefined'])
        end
        it 'b = nil' do
          payload = {"type"=>"linear", "a"=>"5", "b"=>nil, "c"=>"5"}

          expect(EquationSolution.new(payload).result)
            .to eq(['Param error! b undefined'])
        end
      end
      context 'when quadratic' do
        it 'a = nil' do
          payload = {"type"=>"quadratic", "a"=>nil, "b"=>"4", "c"=>"3"}

          expect(EquationSolution.new(payload).result)
            .to eq(['Param error!! a = 0 or undefined'])
        end
        it 'a = 0' do
          payload = {"type"=>"quadratic", "a"=>"0", "b"=>"4", "c"=>"3"}

          expect(EquationSolution.new(payload).result)
            .to eq(['Param error!! a = 0 or undefined'])
        end
        it 'b = nil' do
          payload = {"type"=>"quadratic", "a"=>"1", "b"=>nil, "c"=>"3"}

          expect(EquationSolution.new(payload).result)
            .to eq(['Param error!! b undefined'])
        end
        it 'c = nil' do
          payload = {"type"=>"quadratic", "a"=>"1", "b"=>"4", "c"=>nil}

          expect(EquationSolution.new(payload).result)
            .to eq(['Param error!! c undefined'])
        end
      end
      it 'type = cubic' do
        payload = {"type"=>"cubic", "a"=>"1", "b"=>"4", "c"=>"3"}

        expect(EquationSolution.new(payload).result)
          .to eq(['Type equation error'])
      end
    end
  end
end
