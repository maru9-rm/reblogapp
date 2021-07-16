class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
  # viewsのlayoutのmailerというファイルをテンプレートを使ってemailを作成する
end


# Herokuの設定をしてないので、デプロイした際はそちらの処理を行うこと
# https://www.daily-trial.com/lessons/ruby/courses/6eaa7509/articles/5aee2cf4
# 05 Heroku側の設定
