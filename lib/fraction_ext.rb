require 'fraction'

class Fraction

  def self.from_float(float)
    new(float)
  end

  def initialize(float)
    @float = float
  end

  def numerator
    @float.fraction[0]
  end

  def denominator
    @float.fraction[1]
  end

end

