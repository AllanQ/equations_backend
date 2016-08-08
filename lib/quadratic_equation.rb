require_relative '../lib/equation'

class QuadraticEquation < Equation

  def result
    if self.a == 0 || self.a == nil
      return ['There is param error!! a = 0 or undefined']
    end
    return ['There is param error!! b undefined'] if self.b == nil
    return ['There is param error!! c undefined'] if self.c == nil
    d = discriminant
    return ['The are not any rational roots'] if d < 0
    return [-self.b/(2*self.a)] if d == 0
    [(-self.b+d**0.5)/(2*self.a), (-self.b-d**0.5)/(2*self.a)]
  end

  def discriminant
    self.b**2 - 4*self.a*self.c
  end
end
