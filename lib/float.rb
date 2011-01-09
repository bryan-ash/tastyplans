require 'fraction_ext'

class Float

  def integer_part
    self.truncate
  end

  def fractional_part
    (self - integer_part)
  end

  def fraction_string
    "#{to_fraction.numerator}/#{to_fraction.denominator}"
  end

  def fractional_part_fraction_string
    fractional_part.fraction_string
  end

  def to_fraction
    Fraction.from_float(self)
  end

  def to_mixed_fraction_string
    return "" if self.zero?
    return integer_part.to_s if fractional_part == 0
    return fractional_part_fraction_string if integer_part == 0
    "#{integer_part} #{fractional_part_fraction_string}"
  end

end

