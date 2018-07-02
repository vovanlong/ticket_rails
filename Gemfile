source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.0'
gem 'sqlite3'
gem 'puma', '~> 3.11'
gem 'bcrypt', '~> 3.1', '>= 3.1.12'
gem 'jwt'
gem 'pry-rails'
gem 'paperclip'
gem 'simple_command', '~> 0.0.9'
gem 'rack-cors', '~> 1.0', '>= 1.0.2'
gem 'kaminari'
gem "faker", :git => "https://github.com/stympy/faker.git", :branch => "master"
gem 'bootsnap', '>= 1.1.0', require: false
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
