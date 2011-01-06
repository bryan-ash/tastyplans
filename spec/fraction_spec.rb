require 'fraction_ext'

describe Fraction do
  context "created from a float 0.1" do
    let(:fraction) { Fraction.from_float(0.1) }
    
    it "has a numerator of 1" do 
      fraction.numerator.should == 1
    end

    it "has a denominator of 10" do
      fraction.denominator.should == 10
    end
  end
  
  context "created from a float 0.4" do
    let(:fraction) { Fraction.from_float(0.4) }
    
    it "has a numerator of 2" do 
      fraction.numerator.should == 2
    end

    it "has a denominator of 5" do
      fraction.denominator.should == 5
    end
  end
end
