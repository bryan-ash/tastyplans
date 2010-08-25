class Recipe < ActiveRecord::Base

  has_many :ingredient_amounts
  has_many :ingredients, :through => :ingredient_amounts

  default_scope :order => 'name ASC'
  
  scope :with_ingredients, lambda { |ingredients| where(ingredients.include? :ingredient_amounts) }

  def self.suggestion(current = nil)
    first unless current
    last
  end

end
