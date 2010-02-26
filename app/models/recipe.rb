class Recipe < ActiveRecord::Base

  has_many :ingredient_amounts
  has_many :ingredients, :through => :ingredient_amounts

  default_scope :order => 'name ASC'
  
#   named_scope :with_ingredients, lambda { |ingredients|
#     { :joins => :ingredients, :conditions => { :ingredient_amounts => { :ingredient_id => ingredients } } } }

  def self.suggestion(current = nil)
    first unless current
    last
  end

end
