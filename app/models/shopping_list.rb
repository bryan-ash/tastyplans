class ShoppingList

  def initialize
    @amounts = {}
  end

  def add(ingredient_amount)
    name = ingredient_amount.ingredient.name
    item = "#{ingredient_amount.unit}_#{name}"
    if @amounts.has_key? item
      @amounts[item].amount = (@amounts[item].amount.to_i + ingredient_amount.amount.to_i).to_s
    else
      @amounts[item] = ingredient_amount
    end
    self
  end

  def ingredient_amounts
    @amounts.values.sort { |a,b| a.ingredient.name <=> b.ingredient.name }
  end

end

