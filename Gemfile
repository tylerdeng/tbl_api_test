source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use pg as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
gem 'yui-compressor', '~> 0.12.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

#Devise is a flexible authentication solution for Rails based on Warden
gem 'devise'

gem 'devise-encryptable'

#Haml (HTML Abstraction Markup Language)
gem 'haml'
gem 'dropbox-sdk'
gem 'groupify'

# Pagination library for Rails, Sinatra, Merb, DataMapper
gem 'will_paginate'

# font-awesome-rails provides the Font-Awesome web fonts and stylesheets as a Rails engine for use with the asset pipeline.
gem 'font-awesome-rails'

# The hassle-free way to integrate analytics into any Ruby application. https://segment.com/libraries/ruby
gem 'analytics-ruby'

# A Ruby wrapper for the Zenfolio API
gem 'zenfolio', '~> 0.0.1'

# The power of Mad Mimi in your Ruby application. Deliver emails, track statistics, and manage your subscriber base with ease.
# https://github.com/madmimi/madmimi-gem - https://madmimi.com/
gem 'madmimi'

#Gem for reading and writing data from the SmugMug 1.3.0 API.
gem 'ruby-smugmug', '~> 0.0.1'

# AWS SDK for Ruby
gem 'aws-sdk', '~> 2'

# New Relic is a performance management system, developed by New Relic, Inc
gem 'newrelic_rpm', '~> 3.11.2.286'

# Redis instrumentation for Newrelic.
gem 'newrelic-redis', '~> 2.0.0'

#A Ruby client that tries to match Redis' API one-to-one, while still providing an idiomatic interface. It features thread-safety, client-side sharding, pipelining, and an obsession for performance.
gem 'redis', '~> 3.2.1'

# ActiveZuora - Zuora API based on ActiveModel and auto-generated from your zuora.wsdl.
gem 'active_zuora', '~> 2.2.6'

# Delayed_job (or DJ) encapsulates the common pattern of asynchronously executing longer tasks in the background.
gem 'delayed_job', '~> 4.0.6'
gem 'delayed_job_active_record'

# The Honeybadger gem is for integrating apps with Honeybadger exception, uptime and performance monitoring service.
# not installed http://docs.honeybadger.io/article/27-setting-up-exception-monitoring-in-ruby-on-rails-3-and-4
gem 'honeybadger', '~> 2.0'

gem 'uuidtools'

gem 'rails_admin', '~> 0.6.8'

gem 'paper_trail', '~> 3.0.8', require: false

#gem 'api_docs'
#gem 'apidocs'

#gem 'less-rails'
#gem 'twitter-bootstrap-rails', '~> 3.2.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  #rspec-rails is a testing framework for Rails 3.x and 4.x.
  gem 'rspec-rails', '~> 3.2.3'

  # factory_girl is a fixtures replacement with a straightforward definition syntax, support for multiple build strategies
  gem 'factory_girl_rails', '~> 4.0'

  # Faker, a port of Data::Faker from Perl, is used to easily generate fake data: names, addresses, phone numbers, etc.
  gem 'faker', '~> 1.4.3'

  # RSpec::Its provides the its method as a short-hand to specify the expected value of an attribute.
  gem 'rspec-its'

  gem 'pry-byebug'

  gem 'rspec-mocks', '~> 3.2.1'

  gem "bullet"
  gem 'capybara'
end

group :test do
  gem 'poltergeist'
  gem 'webrat', '~> 0.7.3'
  gem 'cucumber-rails', :require => false
  gem 'selenium-webdriver'
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
#  gem 'less', '~> 2.6.0'
#  gem 'therubyracer', '~> 0.12.1'

  # Shoulda Matchers provides RSpec- and Minitest-compatible one-liners that test common Rails functionality.
  gem 'shoulda-matchers'

  # Matchers to test before, after and around hooks(currently supports method and object callbacks):
  gem 'shoulda-callback-matchers', '~> 1.1.1'

  # SimpleCov is a code coverage analysis tool for Ruby.
  gem 'simplecov', :require => false

  gem 'codeclimate-test-reporter', group: :test, require: nil

  gem 'cucumber-api-steps', :require => false
  gem 'simplecov-rcov'

 # gem 'ci_reporter_rspec', '~> 1.0.0'
 # gem 'ci_reporter_cucumber', '~> 1.0.0'
 # gem 'rspec-legacy_formatters'

  gem 'rubocop', require: false
end

