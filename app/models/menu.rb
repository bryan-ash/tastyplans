class Menu
  extend ActiveModel::Naming

  attr_reader :heading

  def initialize(heading)
    @heading = heading
    yield self if block_given?
  end

  def << (item)
    items << item
  end

  def items
    @items ||= []
  end

  def view_name
    ActiveModel::Naming.singular(self).to_sym
  end

end
