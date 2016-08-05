require_relative '../lib/linear_equation'
require_relative '../lib/quadratic_equation'

class EquationSolution
  attr_accessor :type, :equation_params

  def initialize(params)
    all_params = params
    self.type = all_params['type']
    all_params.delete('type')
    self.equation_params = all_params
  end

  def result
    case self.type
    when 'linear' then [LinearEquation.new(self.equation_params).result]
    when 'quadratic' then QuadraticEquation.new(self.equation_params).result
    else ['Type equation error']
    end
  end
end
