class Ingredient < ActiveRecord::Base

  default_scope :order => 'name ASC'

  def self.named_like(name)
    where('ingredients.name ILIKE ?', "%#{name}%")
  end

  validates_presence_of   :name
  validates_uniqueness_of :name
  
end
