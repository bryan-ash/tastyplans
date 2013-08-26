require 'float'

describe "Float#to_mixed_fraction_string" do

  [[1.0, "1"],
   [2.0, "2"],
   [0.1, "1/10"],
   [0.5, "1/2"],
   [1.5, "1 1/2"],
   [42.8, "42 4/5"],
   [0.0,  ""],
   [0.25, "1/4"],
   [0.08, "1/12"]
  ].each do |input, output|
    it "is #{output} for #{input}" do
      input.to_mixed_fraction_string.should == output
    end
  end
  
end
