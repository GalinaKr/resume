source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'active_storage_validations'            # Validation set for activestorage
gem 'amazing_print', '~> 1.2', '>= 1.2.1'   # Replacement for awesome_print which is depreciated
gem 'bootsnap', '>= 1.4.2', require: false  # Reduces boot times through caching; required in config/boot.rb
gem 'devise', '~> 4.7', '>= 4.7.3'          # Flexible authentication solution for Rails with Warden
gem 'geocoder', '>=1.6.4'                   # Forward and reverse geocoding, IP address geocoding
gem 'google_sign_in', '~> 1.2'              # Sign in (or up) with Google for Rails applications: https://github.com/basecamp/google_sign_in
gem 'httparty', '~> 0.18.1'                 # Library to build easily classes that can use Web-based APIs and related services
gem 'image_processing', '~> 1.2'            # Provides higher-level image processing helpers that are commonly needed when handling image uploads
gem 'jbuilder', '~> 2.7'                    # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'mini_magick', '~> 4.10', '>= 4.10.1'   # Manipulate images with minimal use of memory via ImageMagick / GraphicsMagick
gem 'omniauth', '~> 1.9', '>= 1.9.1'        # Omniauth logins
gem 'omniauth-google-oauth2', '~> 0.8.1'    # Omniauth for google
gem 'pagy', '~> 3.5'                        # Agnostic pagination in plain ruby
gem 'pg', '>= 0.18', '< 2.0'                # Use postgresql as the database for Active Record
gem 'premailer-rails', '~> 1.11', '>= 1.11.1' # Styling HTML emails with CSS without having to do the hard work ourselves
gem 'puma', '~> 4.1'                        # Use Puma as the app server
gem 'rails', '~> 6.1', '>= 6.1.1'           # If you're not sure what this is for then you're in the wrong place ;)
gem 'sass-rails', '>= 6'                    # Use SCSS for stylesheets
gem 'table_print', '~> 1.5', '>= 1.5.7'     # Allows viewing of data in console in nice ways, including table joins: http://tableprintgem.com/ (video)
gem 'turbolinks', '~> 5'                    # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'webpacker', '~> 5.2', '>= 5.2.1'       # Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'wicked', '~> 1.3', '>= 1.3.2'          # Wicked is a Rails engine for producing easy wizard controllers

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'letter_opener'                                   # Allows for seeing sent emails in dev environment
  gem 'letter_opener_web'                               # GUI for letter_opener
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
