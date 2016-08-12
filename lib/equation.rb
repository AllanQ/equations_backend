class Equation
  attr_accessor :a, :b, :c

  def initialize(params)
    self.a = to_f_if_numeric(params['a'])
    self.b = to_f_if_numeric(params['b'])
    self.c = to_f_if_numeric(params['c'])
  end

  # private

  def to_f_if_numeric(str)
    (str && str.numeric?) ? str.to_f : str
  end
end
