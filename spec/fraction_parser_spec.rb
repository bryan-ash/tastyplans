require 'rubygems'
require 'treetop'
require 'mixed_fraction'

describe MixedFractionParser do
  describe "parsing" do
    [['1',       1.0],
     ['2',       2.0],
     ['10',     10.0],
     ['1/2',     0.5],
     ['1/10',    0.1],
     ['0.5',     0.5],
     ['0.5/0.5', 1.0],
     ['1-1/2',   1.5],
     ['1 1/2',   1.5]
    ].each do |input, output|
      it "'#{input}' => #{output}" do
        parser = MixedFractionParser.new
        parser.parse(input).to_f.should == output
      end
    end
  end
end
