require 'fraction_ext'

describe Fraction do
  [[0.1,  1, 10],
   [0.4,  2, 5],
   [0.25, 1, 4]
  ].each do |float, numerator, denominator|
    context "created from a float #{float}" do
      let(:fraction) { Fraction.from_float(float) }
      
      it "has a numerator of #{numerator}" do 
        fraction.numerator.should == numerator
      end

      it "has a denominator of #{denominator}" do
        fraction.denominator.should == denominator
      end
    end
  end
end
