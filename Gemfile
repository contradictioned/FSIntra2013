source 'https://rubygems.org'
source 'https://rails-assets.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'

group :production do
  gem 'pg'
end

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'uglifier', '>= 1.0.3'

gem 'jquery-rails'
gem 'jquery-ui-rails'

# Handling cron
gem 'whenever', require: false

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'


group :assets do
  # Gems used only for assets and not required
  # in production environments by default.
  gem 'sass-rails', '~> 4.0.3'
  gem 'coffee-rails', '~> 4.0.1'
  gem 'compass-rails'
  gem 'modular-scale'
  gem 'modernizr-rails'

  gem 'rails-assets-gumby'
end


group :test do
  gem 'database_cleaner'
  gem 'simplecov', :require => false
  gem 'capybara'

  # Uncomment this line on OS X.
  # gem 'growl'

  # Uncomment these lines on Linux.
  gem 'libnotify'

  # Uncomment these lines on Windows.
  # gem 'rb-notifu'
  # gem 'win32console'
end

group :development, :test do
  gem 'factory_girl_rails'

  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'guard-spork', '~> 1.5.0'
  gem 'spork-rails', github: 'sporkrb/spork-rails'
  gem 'sqlite3'
end

group :development do
	gem 'bullet'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'quiet_assets'
  gem 'faker'
  gem 'rest-client'

  # This gem is intentionally not in the Gemfile, since the
  # mailcatcher website recommends to install it via
  # gem install mailcatcher
  # gem 'mailcatcher'

  gem 'spring'

  gem 'brakeman', :require => false
end

gem 'net-ldap'
gem 'annotate'
gem 'haml'
gem 'haml-rails'

# barcodes
gem 'barby'

# for generating pdfs of html
# wkhtmltopdf needs to be installed and the path might be explicitly set
# see: https://github.com/mileszs/wicked_pdf
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

# for vcards
gem 'vpim-rails', :git => 'https://github.com/fraser/vpim-rails'
gem 'rqrcode-rails3'
gem 'mini_magick'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', group: :development

# To use debugger
# gem 'debugger'

# Tags for the people
gem 'acts-as-taggable-on'

# Ransack for better searches (+ easy sortable columns)
# gem 'ransack' # Maybe wee still need this? @s_wolff

# CanCan
gem 'cancan'

# Script that takes html strings and generates markdown.
gem 'reverse_markdown'

# Storing Avatars
gem "paperclip", "~> 4.1"
