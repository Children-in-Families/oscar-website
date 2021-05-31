source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails',              '~> 5.1.4'
gem 'pg',                 '~> 0.19.0'
gem 'puma',               '~> 3.7'
gem 'sass-rails',         '~> 5.0'
gem 'uglifier',           '>= 1.3.0'
gem 'coffee-rails',       '~> 4.2'
gem 'turbolinks',         '~> 5'
gem 'jbuilder',           '~> 2.5'
gem 'camaleon_cms',       '~> 2.4', '>= 2.4.2'
gem 'activemodel-serializers-xml', git: 'https://github.com/rails/activemodel-serializers-xml'
gem 'draper',             '~> 3'
gem 'camaleon_post_order','~> 0.0.2'
gem 'dotenv-rails',       '~> 2.1', '>= 2.1.1'
gem 'humanize',           '~> 1.7'

gem 'haml',               '~> 5.0', '>= 5.0.4'
gem 'bootstrap-sass',     '~> 3.3', '>= 3.3.7'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.2'
gem 'jquery-rails',       '~> 4.3', '>= 4.3.1'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara',         '~> 2.13'
  gem 'selenium-webdriver'
  gem 'brakeman', :require => false
  gem 'rubocop', '~> 0.48.1'
  gem 'listen',                '~> 3.0.5'
end

group :development do
  gem 'capistrano-rails', '~> 1.3'
  gem 'capistrano-passenger', '~> 0.2.0'
  gem 'capistrano-rvm', '~> 0.1.2'
  gem 'pry', '~> 0.11.3'
end

group :production, :staging do
  gem 'asset_sync',            '~> 2.0'
  gem 'fog',                   '~> 1.42'
  gem 's3'
  gem 'appsignal',             '~> 2.0', '>= 2.0.4'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


#################### Camaleon CMS include all gems for plugins and themes ####################
require './lib/plugin_routes'
instance_eval(PluginRoutes.draw_gems)

#################### Camaleon CMS include all gems for plugins and themes #################### 
require './lib/plugin_routes' 
instance_eval(PluginRoutes.draw_gems)