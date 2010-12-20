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

end
