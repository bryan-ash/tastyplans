begin
  require 'mechanize'
rescue LoadError
end

namespace :ohmabel do
  desc 'Fetch RSS feed with recipes'
  task :fetch_feeds => :environment do
    [ 'http://recipe.com/home/rss/recipecom/rec1013.xml',
      'http://recipe.com/home/rss/recipecom/rec1656.xml',
      'http://recipe.com/home/rss/recipecom/rec1379.xml',
      'http://recipe.com/home/rss/recipecom/rec1213.xml',
      'http://recipe.com/home/rss/recipecom/rec1166.xml',
      'http://recipe.com/home/rss/recipecom/rec1410.xml',
      'http://recipe.com/home/rss/recipecom/rec1449.xml',
      'http://recipe.com/home/rss/recipecom/rec1569.xml',
      'http://recipe.com/home/rss/recipecom/rec1735.xml',
      'http://recipe.com/home/rss/recipecom/rec2899.xml'
    ].each { |url| fetch_feed(url) }
  end
end

def fetch_feed(url)
  feed = Feedzirra::Feed.fetch_and_parse(url)
#   feed = Feedzirra::Feed.fetch_and_parse(url,
#                                          :on_success => lambda {|feed| puts feed.title },
#                                          :on_failure => lambda {|url, response_code, response_header, response_body| puts "#{url}\n#{response_code}: #{response_header}\n#{response_body}" })

  puts "Fetching: #{feed.title} (#{feed.entries.length})"
  feed.entries.each do |entry|
    fetch_recipe(entry.url)
  end
end

def fetch_recipe(url)
  agent = WWW::Mechanize.new

  agent.get(url)

  recipe_name = agent.page.search('h1').text
  ingredients = agent.page.search('.recipedetailslineitemtext').map(&:text).map(&:strip)
  directions  = agent.page.search('.section').map(&:text).map(&:strip).join("\n")

  puts recipe_name
  recipe = Recipe.find_or_create_by_name(:name       => recipe_name,
                                         :directions => directions)
  ingredients.each do |ingredient|
    amount = ingredient[/[\d\/-]+/]
    ingredient_name = ingredient.gsub(/#{amount} */, '')
    puts "(#{amount})\t-#{ingredient_name} [#{ingredient}]"
    ingredient = Ingredient.find_or_create_by_name(ingredient_name)
    ingredient_amount = IngredientAmount.create(:amount     => amount,
                                                :ingredient => ingredient,
                                                :recipe     => recipe)
  end
  puts directions
end
