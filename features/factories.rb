FactoryGirl.define do
  factory :recipe do
    sequence(:name) { |n| "Recipe#{n}" }
    directions 'whip it'
  end
end

FactoryGirl.define do
  factory :meal_plan do
    name 'Meal Plan'
  end
end


