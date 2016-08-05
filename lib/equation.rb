class Equation
  attr_accessor :a, :b, :c

  def initialize(params)
    self.a = params['a'].to_f if params['a']
    self.b = params['b'].to_f if params['b']
    self.c = params['c'].to_f if params['c']
  end
end
