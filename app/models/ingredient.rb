class Ingredient < ActiveRecord::Base

  default_scope :order => 'name ASC'

  validates_presence_of   :name
  validates_uniqueness_of :name
  
end
