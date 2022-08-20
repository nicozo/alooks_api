require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Api
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # localeファイルの読み込みパスを追加
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # バリデーションエラーメッセージの日本語化
    config.i18n.default_locale = :ja

    # libディレクトリを読み込む
    config.paths.add 'lib', eager_load: true

    # Railsアプリデフォルトのタイムゾーン
    config.time_zone = ENV['TZ']

    # データベースから日付・時刻を取り出した際のタイムゾーン
    config.active_record.default_timezone = :local

    # Zeitwerk有効時false推奨
    config.add_autoload_paths_to_load_path = false
    config.autoloader = :classic

    config.generators do |g|
      #testファイルの自動生成を不可
      g.test_framework :rspec
      g.skip_routes true
    end

    # Cookieを処理するmiddleware
    config.middleware.use ActionDispatch::Cookies

    config.action_dispatch.cookies_same_site_protection = ENV['COOKIES_SAME_SITE'].to_sym if Rails.env.production?

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
