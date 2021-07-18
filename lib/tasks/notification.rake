namespace :notification do
    desc '利用者にメールを送付する'
  
    task send_emails_from_admin: :environment do
        NotificationFromAdminJob.perform_later('rake task test')
    end
end


# 拡張子が.rbじゃなくて.rakeであることに注意！

# rakeタスクとはアプリケーションを起動せずともコマンドラインから実行できるタスク

# rails notification:send_emails_from_admin をターミナルで実行すれば上記タスクが実行される