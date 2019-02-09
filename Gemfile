source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'jbuilder', '~> 2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.2'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'rspec-rails', '~> 3.8' # Unit testing Framework
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end
