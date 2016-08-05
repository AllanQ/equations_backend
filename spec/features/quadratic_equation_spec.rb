require_relative '../../lib/quadratic_equation'

describe QuadraticEquation do
  it 'discriminant' do
    equation_params = {"a"=>"5", "b"=>"6", "c"=>"7"}

    expect(QuadraticEquation.new(equation_params).discriminant).to eq(6**2-4*5*7)
  end

  it 'result' do
    equation_params = {"a"=>"1", "b"=>"5", "c"=>"4"}

    expect(QuadraticEquation.new(equation_params).result).to eq([-1.0,-4.0])
  end
end
