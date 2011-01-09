require 'fraction'

class Fraction

  def self.from_float(float)
    new(float)
  end

  def initialize(float)
    @float = float
    @fraction = float.fraction(12)
  end

  def numerator
    @fraction[0]
  end

  def denominator
    @fraction[1]
  end

end

