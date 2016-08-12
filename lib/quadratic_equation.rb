require_relative '../lib/equation'
require_relative '../lib/string'

class QuadraticEquation < Equation

  def result
    if self.a == 0 || self.a == '' || self.a == nil
      return ['Param error!! a = 0 or undefined']
    end
    return ['Param error!! b undefined'] if self.b == '' || self.b == nil
    return ['Param error!! c undefined'] if self.c == '' || self.c == nil
    return ['Wrong format a param'] unless self.a.to_s.numeric?
    return ['Wrong format b param'] unless self.b.to_s.numeric?
    return ['Wrong format c param'] unless self.c.to_s.numeric?
    d = discriminant
    return ['No any rational roots'] if d < 0
    return [-self.b/(2*self.a)] if d == 0
    [(-self.b+d**0.5)/(2*self.a), (-self.b-d**0.5)/(2*self.a)]
  end

  # private

  def discriminant
    self.b**2 - 4*self.a*self.c
  end
end
