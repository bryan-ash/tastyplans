desc "Deploy to Heroku"
task :deploy do
  %x{ heroku maintenance:on }
  sleep 2
  %x{ git push heroku master }
  sleep 2
  %x{ heroku rake db:migrate }
  sleep 2
  %x{ heroku maintenance:off }
end
