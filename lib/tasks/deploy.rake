desc "Deploy to Heroku"
task :deploy do
  %x{ heroku maintenance:on }
  %x{ git push heroku master }  
  %x{ heroku rake db:migrate }
  %x{ heroku maintenance:off }
end
