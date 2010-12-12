begin
  require 'deadweight'
rescue LoadError
end

desc "run Deadweight CSS check (requires server)."
task :deadweight => :environment do
  dw = Deadweight.new
  dw.stylesheets = %w( /stylesheets/style.css )
  dw.pages = %w( / /users/sign_in /users/sign_up /recipe_finders/new /recipes /recipes/478 /recipes/478/edit )
  dw.ignore_selectors = /flash_notice|flash_alert|error_explanation|field_with_errors/
  puts dw.run
end
