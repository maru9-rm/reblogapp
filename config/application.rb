require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Reblogapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.i18n.default_locale = :ja
    # サーバーを再起動しないと↑これ読み込まないので注意
    # 言語設定！言語はJa（日本語）であることを記述。　localesにja.ymlファイルを作成して、そこに設定を書こう。ja.yml内の翻訳内容はどっかからコピペでおk

    config.active_job.queue_adapter = :sidekiq
    # サイドキックを動かすための設定
  end
end
