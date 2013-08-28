class Ingredient < ActiveRecord::Base

  validates_presence_of :name
  
  default_scope -> { order 'name ASC' }

  Unit = {
    'tablspoon'  => 'tablespoon',
    'tbs.'       => 'tablespoon',
    'tbsp.'      => 'tablespoon',
    'tsp.'       => 'teaspoon',
    'lb.'        => 'pound',
    'lbs.'       => 'pound',
    'oz.'        => 'ounce',
    'whole head' => 'head'
  }
  
  def remove_unit_from_name
    self.name =~ /^(clove|cup|dash|drop|whole head|head|ounce|oz.|pint|lbs?.|pound|sprig|stalk|stick|table?spoon|tbsp?.|teaspoon|tsp.)s? +(.*)/
    unit_in_name = Unit[$1] || $1
    name = $2
    
    self.update_attributes(:name => name) if unit_in_name
    return unit_in_name
  end

end
