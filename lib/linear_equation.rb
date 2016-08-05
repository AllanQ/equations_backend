require_relative '../lib/equation'

class LinearEquation < Equation

  def result
    if self.a == 0 || self.a == nil
      return 'There is param error! a = 0 or undefined'
    end
    return 'There is param error! b undefined' if self.b == nil
    return 0 if self.b == 0
    -self.b/self.a
  end
end
