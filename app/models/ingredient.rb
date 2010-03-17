class Ingredient < ActiveRecord::Base

  default_scope :order => 'name ASC'

  scope :named_like, lambda { |name| where('name ILIKE ?', "%#{name}%") }

  validates_presence_of   :name
  validates_uniqueness_of :name
  
end
