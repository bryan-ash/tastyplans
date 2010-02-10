class Recipe < ActiveRecord::Base

  has_many :ingredient_amounts

  def self.suggestion(current = nil)
    first unless current
    last
  end

end
