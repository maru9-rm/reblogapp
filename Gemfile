source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.7'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'annotate'
# bundle install 後に rails g annotate:install を実行し、 rails db:migrate
gem 'active_decorator'
# bundle installしたら rails g decorator user を実行！
gem 'active_model_serializers'
# ターミナルで rails g serializer Comment(インスタンスの名前) を実行。
# appのserializerにファイルができる
# インスタンスをいい感じにjsonに変換してくれる

gem 'faker'
# ダミーデータを簡単に作成するgem

gem 'devise'
# bundle install したら rails g devise:install を実行する そのあとは指示に従って操作を！
# 最後にUserモデルを作成しましょう。rails g devise User → rails db:migrate
gem 'hamlit'

gem 'sidekiq'
# railsで非同期処理を実行するgem
# 使い方はググれば出てくるのでそれ見ながらやろう。
# サーバーを立ち上げるときは bundle exec sidekiq -C config/sidekiq.yml

# Use Active Storage variant
gem 'image_processing', '~> 1.2'
# ↑アクションテキスト入れるためにコメントアウトしてbundle install！
# これとは別にターミナルで 以下三つを実行すること。
# brew install imagemagick
# bundle exec rails action_text:install
# bundle exec rails webpacker:install

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-byebug'
  # デバックツール！ binding.pry　を挿入した場所で止まってその状態で変数の確認とかをできる
  gem 'rubocop-rails'
  # rubocop.ymlというファイルを作って、設定をして、bundle exec rubocop -a で自動で色々直してくれる
  gem 'rspec-rails'
  # rails g rspec:install を実行
  # モデルのテスト rails g rspec:model article を実行(articleの部分はモデル名)
  # テストの実行はターミナルで bundle exec rspec spec/models/article_spec.rb を実行
  # コントローラーのテスト rails g rspec:request article を実行(articleの部分はコントローラー名)
  # テストの実行はターミナルで bundle exec rspec spec/requests/articles_spec.rb
  # apiのテスト rails g rspec:request api/comment 実行




  gem 'factory_bot_rails'

end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'erb2haml'
  # bundle exec rake haml:replace_erbs

  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'letter_opener'
  gem 'letter_opener_web', '~> 1.0'
  # 送信したメールのチェックをおこないやすくするツール
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
