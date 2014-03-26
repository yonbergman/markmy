task :powenv_to_heroku => :environment do
  path = File.expand_path('.powenv', Rails.root)
  vars = File.readlines(path).map(&:chomp).map { |var| var.sub(/^export /, '') }
  sh "heroku config:set #{vars.join(' ')}"
end
