class IngredientAmount < ActiveRecord::Base

  belongs_to :ingredient
  belongs_to :recipe

  acts_as_list :scope => :recipe
  
  default_scope order('position ASC')
  
  accepts_nested_attributes_for :ingredient,
  :reject_if => lambda { |a| a[:name].blank? },
  :allow_destroy => true

  after_initialize :create_ingredient
  
  def create_ingredient
    self.ingredient ||= Ingredient.new
  end

  def decimal_amount
    return 0.0 unless self.amount
    MixedFractionParser.new.parse(self.amount).to_f
  end

  def mixed_fraction_amount
    decimal_amount.to_mixed_fraction_string
  end

  def formatted
    "#{mixed_fraction_amount} #{self.unit} #{self.ingredient.name}"
  end

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
  
  def update_unit_from_ingredient_name
    IngredientAmount.transaction do
      self.ingredient.name =~ /^(clove|cup|dash|drop|whole head|head|ounce|oz.|pint|lbs?.|pound|sprig|stalk|stick|table?spoon|tbsp?.|teaspoon|tsp.)s? +(.*)/
      unit = Unit[$1] || $1
      name = $2

      self.update_attributes(:unit => unit)
      self.ingredient.update_attributes(:name => name)
    end
  end

end
