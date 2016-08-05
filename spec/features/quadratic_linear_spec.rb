require_relative '../../lib/linear_equation'

describe LinearEquation do
  it 'result' do
    equation_params = {"a"=>"1", "b"=>"5", "c"=>"4"}

    expect(LinearEquation.new(equation_params).result).to eq(-5.0)
  end
end
