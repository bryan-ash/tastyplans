source :gemcutter

gem 'devise'
gem 'haml'
gem 'meta_where', :git => 'git://github.com/ernie/meta_where.git'
gem 'pg'
gem 'rails'
gem 'rdiscount'

# thin is required for Heroku until further notice
gem 'thin'

group :development do
  gem 'heroku'
  gem 'deadweight'

  # These are needed for devise generators:
  gem 'hpricot'
  gem 'ruby_parser'

  gem 'mechanize'
end

group :test do
  gem 'capybara', :git => 'git://github.com/jnicklas/capybara.git'
  gem 'cucumber'
  gem 'cucumber-rails'
  gem 'culerity'
  gem 'celerity', :require => nil # JRuby only. Make it available but don't require it in any environment.
  gem 'database_cleaner'

  gem 'email_spec'
  gem 'factory_girl_rails'

  gem 'rspec'
  gem 'rspec-rails', '>= 2.0.0.beta.1'

  gem 'spork'
  gem 'test-unit', '= 1.2.3'
  gem 'webrat'
end
