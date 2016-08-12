require_relative '../lib/equation'
require_relative '../lib/string'

class LinearEquation < Equation

  def result
    if self.a == 0 || self.a == '' || self.a == nil
      return 'Param error! a = 0 or undefined'
    end
    return 'Param error! b undefined' if self.b == '' || self.b == nil
    return 0 if self.b == 0
    return 'Wrong format a param' unless self.a.to_s.numeric?
    return 'Wrong format b param' unless self.b.to_s.numeric?
    -self.b/self.a
  end
end
