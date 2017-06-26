# frozen_string_literal: true
source "https://rubygems.org"

ruby "2.4.1"

gem "haml"
gem "hanami", "~> 1.0"
gem "hanami-model", "~> 1.0"
gem "pg"
gem "rake"

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem "shotgun"
end

group :test, :development do
  gem "dotenv", "~> 2.0"
  gem "factory_girl"
  gem "faker"
  gem "pry"
  gem "pry-nav"
  gem "rubocop"
end

group :test do
  gem "capybara"
  gem "rspec"
end

group :production do
  # gem 'puma'
end
