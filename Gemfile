source 'https://rubygems.org'

ruby '2.2.2'

gem 'rails', '4.2.5'
gem 'rails-api'

##### Database #####
gem 'sqlite3'

##### Environment Variable #####
gem 'figaro'

##### JSON generation #####
gem 'active_model_serializers'

##### Request #####
gem 'typhoeus'

##### Coding Style #####
gem 'brakeman'
gem 'bullet'
gem 'rails_best_practices'
gem 'rubocop'

##### Automate Code Review #####
gem 'saddler'
gem 'saddler-reporter-github'

group :development, :test do
  ##### Debugging #####
  gem 'awesome_print'
  gem 'pry-byebug'
  gem 'annotate'

  ##### Testing #####
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'spring'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'webmock'
  gem 'simplecov', require: false
end
