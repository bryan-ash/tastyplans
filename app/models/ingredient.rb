class Ingredient < ActiveRecord::Base

  default_scope :order => 'name ASC'

  named_scope :named_like, lambda { |name| { :conditions => ['name ILIKE ?', "%#{name}%"] } }

  validates_presence_of   :name
  validates_uniqueness_of :name
  
end
