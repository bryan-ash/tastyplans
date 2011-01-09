require 'spec_helper'

describe IngredientAmount do
  [['clove garlic', 'clove', 'garlic'],
   ['cups hope', 'cup', 'hope'],
   ['dash joy', 'dash', 'joy'],
   ['drop fun', 'drop', 'fun'],
   ['head lettuce', 'head', 'lettuce'],
   ['whole head garlic', 'head', 'garlic'],
   ['pint lager', 'pint', 'lager'],
   ['pints lager', 'pint', 'lager'],
   ['pint  lager', 'pint', 'lager'],
   ['teaspoon sugar', 'teaspoon', 'sugar'],
   ['tsp. sugar', 'teaspoon', 'sugar'],
   ['tablespoons lard', 'tablespoon', 'lard'],
   ['tablspoon spell', 'tablespoon', 'spell'],
   ['tbs. flour', 'tablespoon', 'flour'],
   ['tbsp. flour', 'tablespoon', 'flour'],
   ['ounce lovin', 'ounce', 'lovin'],
   ['oz. lovin', 'ounce', 'lovin'],
   ['pound flesh', 'pound', 'flesh'],
   ['lb. flesh', 'pound', 'flesh'],
   ['lbs. flesh', 'pound', 'flesh'],
   ['sprig  rosemary', 'sprig', 'rosemary'],
   ['stalk celery', 'stalk', 'celery'],
   ['stick butter', 'stick', 'butter'],
  ].each do |old_name, unit, new_name|
    context "given an ingredient name '#{old_name}'" do
      let(:ingredient) { Ingredient.create(:name => old_name) }
      let(:ingredient_amount) { IngredientAmount.create(:ingredient => ingredient) }

      it "extracts unit '#{unit}', leaving ingredient name '#{new_name}'" do
        ingredient_amount.update_unit_from_ingredient_name

        ingredient_amount.unit.should == unit
        ingredient.name.should == new_name
      end
    end
  end
end
