class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
  # viewsのlayoutのmailerというファイルをテンプレートを使ってemailを作成する
end
