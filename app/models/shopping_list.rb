class ShoppingList

  def initialize
    @amounts = {}
  end

  def add(ingredient_amount)
    name = ingredient_amount.ingredient.name
    item = "#{ingredient_amount.unit}_#{name}"

    if @amounts.has_key? item
      @amounts[item].amount = (@amounts[item].decimal_amount + ingredient_amount.decimal_amount).to_s
    else
      @amounts[item] = ingredient_amount.dup
#       @amounts[item].amount = @amounts[item].amount.decimal_amount if @amount[item].amount
    end
    
    self
  end

  def ingredient_amounts
    @amounts.values.sort { |a,b| a.ingredient.name <=> b.ingredient.name }
  end

end

