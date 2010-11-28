source :gemcutter

gem 'rails'
gem 'haml'
gem 'pg'
gem 'devise'

# thin is required for Heroku until further notice
gem 'thin'

gem 'heroku'
gem 'meta_where', :git => 'git://github.com/ernie/meta_where.git'

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

  gem 'mechanize'

  # These are needed for devise generators:
  gem 'hpricot'
  gem 'ruby_parser'
end
