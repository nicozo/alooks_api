source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.5'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
# ログイン機能 Doc: https://github.com/Sorcery/sorcery/
gem 'sorcery', '~> 0.16.3'
# Enum用 Doc: https://github.com/zmbacker/enum_help/
gem 'enum_help', '~> 0.0.17'
# JWT認証用 Doc: https://github.com/jwt/ruby-jwt/
gem 'jwt', '~> 2.3'
# uninitialized constant Mail::TestMailer (NameError)エラー回避
gem 'net-smtp'
gem 'net-imap'
gem 'net-pop'

# HTTPリクエスト用 Doc: https://github.com/httprb/http
gem 'http', '~> 5.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # N+1問題用 Doc: https://github.com/flyerhzm/bullet/
  gem 'bullet', '~> 7.0', '>= 7.0.1'
  # デバッグ用 Doc: https://github.com/deivid-rodriguez/pry-byebug/
  gem 'pry-byebug', '~> 3.9'
  # 環境変数用のgem Doc: https://github.com/bkeepers/dotenv/
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'
  # Rails Rspec Doc: https://github.com/rspec/rspec-rails/
  gem 'rspec-rails', '~> 5.1', '>= 5.1.1'
  # FactoryBot Doc: https://github.com/thoughtbot/factory_bot_rails/
  gem 'factory_bot_rails', '~> 4.11'
  # rubocop Doc: https://github.com/rubocop/rubocop/
  gem 'rubocop', '~> 1.26', '>= 1.26.1', require: false
  # rubocop-rails Doc: https://github.com/rubocop/rubocop-rails
  gem 'rubocop-rails', '~> 2.14', '>= 2.14.2', require: false
  # rubocop-checkstyle_formatter Doc: https://github.com/eitoball/rubocop-checkstyle_formatter/
  gem 'rubocop-checkstyle_formatter', '~> 0.5.0', require: false
  # ダミーデータ用 Doc: https://github.com/faker-ruby/faker
  gem 'faker', '~> 2.20'
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # エラー画面用 Doc: https://github.com/BetterErrors/better_errors/
  gem 'better_errors', '~> 2.9', '>= 2.9.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
